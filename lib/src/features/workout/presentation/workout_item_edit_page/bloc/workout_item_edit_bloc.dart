import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/get_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/set_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc_state.dart';

class WorkoutItemEditBloc
    extends Bloc<WorkoutItemEditBlocEvent, WorkoutItemEditBlocState> {
  final GetWorkoutEditUseCase getWorkoutEditUseCase;
  final SetWorkoutEditUseCase setWorkoutEditUseCase;

  WorkoutItemEditBloc(
    super.initialState, {
    required this.getWorkoutEditUseCase,
    required this.setWorkoutEditUseCase,
  }) {}

  Future<void> _onInitializeEvent(
      Emitter<WorkoutItemEditBlocState> emit) async {
    try {
      final workout = await getWorkoutEditUseCase.execute();

      emit(WorkoutItemEditBlocState(
        loading: false,
        workoutItem: workout,
      ));
    } catch (e) {
      emit(WorkoutItemEditBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onEditEvent(WorkoutEditBlocEvent event,
      Emitter<WorkoutItemEditBlocState> emit) async {
    try {
      emit(WorkoutItemEditBlocState(
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      emit(WorkoutItemEditBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteEvent(Emitter<WorkoutItemEditBlocState> emit) async {
    try {
      final workout = await getWorkoutEditUseCase.execute();

      emit(WorkoutItemEditBlocState(
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      emit(WorkoutItemEditBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
