import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_item/storage/get_workout_item_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_item/storage/remove_workout_item_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_item/storage/set_workout_item_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc_state.dart';

class WorkoutItemEditBloc
    extends Bloc<WorkoutItemEditBlocEvent, WorkoutItemEditBlocState> {
  final SetWorkoutItemUsecase setWorkoutItemUsecase;
  final GetWorkoutItemUsecase getWorkoutItemUsecase;
  final RemoveWorkoutItemUsecase removeWorkoutItemUsecase;

  WorkoutItemEditBloc({
    required this.setWorkoutItemUsecase,
    required this.getWorkoutItemUsecase,
    required this.removeWorkoutItemUsecase,
  }) : super(const WorkoutItemEditBlocState()) {
    on<WorkoutItemEditBlocEvent>(
      (event, emit) async {
        if (event is WorkoutItemEditBlocInitializeEvent) {
          await _onInitializeEvent(emit);
        } else if (event is WorkoutItemEditBlocSaveEvent) {
          await _onSaveEvent(event, emit);
        } else if (event is WorkoutItemEditBlocRemoveEvent) {
          await _onRemoveEvent(emit);
        }
      },
      transformer: sequential(),
    );
    add(WorkoutItemEditBlocInitializeEvent());
  }

  Future<void> _onInitializeEvent(
      Emitter<WorkoutItemEditBlocState> emit) async {
    try {
      final workoutItem = await getWorkoutItemUsecase.execute();

      emit(WorkoutItemEditBlocState(
        loading: false,
        workoutItem: workoutItem,
      ));
    } catch (e) {
      emit(WorkoutItemEditBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSaveEvent(WorkoutItemEditBlocSaveEvent event,
      Emitter<WorkoutItemEditBlocState> emit) async {
    try {
      await setWorkoutItemUsecase.execute(event.workoutItem);

      emit(WorkoutItemEditBlocState(
        loading: false,
        successMessage: 'Workout item saved.',
      ));
    } catch (e) {
      emit(WorkoutItemEditBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRemoveEvent(Emitter<WorkoutItemEditBlocState> emit) async {
    try {
      await removeWorkoutItemUsecase.execute();

      emit(WorkoutItemEditBlocState(
        loading: false,
        successMessage: "Workout item removed.",
      ));
    } catch (e) {
      emit(WorkoutItemEditBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
