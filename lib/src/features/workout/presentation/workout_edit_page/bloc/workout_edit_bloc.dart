import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/delete_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/set_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/clean_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/get_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/set_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_item_id/storage/set_workout_item_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_state.dart';

class WorkoutEditBloc extends Bloc<WorkoutEditBlocEvent, WorkoutEditBlocState> {
  final GetWorkoutUseCase getWorkoutUseCase;
  final SetWorkoutUseCase setWorkoutUseCase;
  final DeleteWorkoutUseCase deleteWorkoutUseCase;
  final GetWorkoutEditUseCase getWorkoutEditUseCase;
  final SetWorkoutEditUseCase setWorkoutEditUseCase;
  final CleanWorkoutEditUseCase cleanWorkoutEditUseCase;
  final SetWorkoutItemIdUsecase setWorkoutItemIdUsecase;

  WorkoutEditBloc({
    required this.getWorkoutUseCase,
    required this.setWorkoutUseCase,
    required this.deleteWorkoutUseCase,
    required this.getWorkoutEditUseCase,
    required this.setWorkoutEditUseCase,
    required this.cleanWorkoutEditUseCase,
    required this.setWorkoutItemIdUsecase,
  }) : super(const WorkoutEditBlocInitializeState()) {
    on<WorkoutEditBlocEvent>(
      (event, emit) async {
        if (event is WorkoutEditBlocInitializeEvent) {
          await _onInitializeEvent(emit);
        } else if (event is WorkoutEditBlocUpdateEvent) {
          await _onUpdateEvent(event, emit);
        } else if (event is WorkoutEditBlocSaveEvent) {
          await _onSaveEvent(event, emit);
        } else if (event is WorkoutEditBlocDeleteEvent) {
          await _onDeleteEvent(event, emit);
        } else if (event is WorkoutEditBlocWorkoutItemPressedEvent) {
          await _onWorkoutItemPressed(event, emit);
        }
      },
      transformer: sequential(),
    );
    add(WorkoutEditBlocInitializeEvent());
  }

  Future<void> _onInitializeEvent(Emitter<WorkoutEditBlocState> emit) async {
    try {
      final workout = await getWorkoutEditUseCase.execute();

      emit(WorkoutEditBlocInitializeState(
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      await cleanWorkoutEditUseCase.execute();
      emit(WorkoutEditBlocInitializeState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateEvent(
    WorkoutEditBlocUpdateEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      final workout = event.workout;

      emit(WorkoutEditBlocInitializeState(
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      emit(WorkoutEditBlocInitializeState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSaveEvent(
    WorkoutEditBlocSaveEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      final workout = event.workout;
      await setWorkoutUseCase.execute(workout);
      await cleanWorkoutEditUseCase.execute();

      emit(const WorkoutEditBlocSaveState(
        loading: false,
        successMessage: 'Workout updated successfully.',
      ));
    } catch (e) {
      emit(WorkoutEditBlocSaveState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteEvent(
    WorkoutEditBlocDeleteEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      await deleteWorkoutUseCase.execute();
      await cleanWorkoutEditUseCase.execute();

      emit(const WorkoutEditBlocDeleteState(
        loading: false,
        successMessage: 'Workout deleted successfully.',
      ));
    } catch (e) {
      emit(WorkoutEditBlocDeleteState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onWorkoutItemPressed(
    WorkoutEditBlocWorkoutItemPressedEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      final workoutItemId = event.workoutItemId;
      await setWorkoutItemIdUsecase.execute(workoutItemId);
    } catch (e) {
      emit(WorkoutEditBlocInitializeState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
