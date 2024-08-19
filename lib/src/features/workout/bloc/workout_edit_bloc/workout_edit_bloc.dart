import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_edit_bloc/workout_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_edit_bloc/workout_edit_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutEditBloc extends Bloc<WorkoutEditBlocEvent, WorkoutEditBlocState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdService;

  WorkoutEditBloc({
    required this.workoutRepository,
    required this.workoutIdService,
  }) : super(WorkoutEditBlocInitialState()) {
    on<WorkoutEditBlocEvent>(
      (event, emit) async {
        if (event is WorkoutEditBlocInitializeEvent) {
          _onInitializeEvent(emit);
        } else if (event is WorkoutEditBlocUpdateEvent) {
          _onUpdateEvent(event, emit);
        } else if (event is WorkoutEditBlocDeleteEvent) {
          _onDeleteEvent(event, emit);
        }
      },
      transformer: sequential(),
    );
    add(WorkoutEditBlocInitializeEvent());
  }

  Future<void> _onInitializeEvent(Emitter<WorkoutEditBlocState> emit) async {
    final loadingState = WorkoutEditBlocLoadingState();
    emit(loadingState);
    try {
      final id = await workoutIdService.get();
      final workout = await workoutRepository.get(id);
      final successState = WorkoutEditBlocSuccessState(workout);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutEditBlocFailureState(message);
      emit(failureState);
    }
  }

  Future<void> _onUpdateEvent(
    WorkoutEditBlocUpdateEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    final loadingState = WorkoutEditBlocUpdateLoadingState();
    emit(loadingState);
    try {
      final workout = event.workout;
      await workoutRepository.set(workout);

      const successMessage = 'Workout updated';
      const successState = WorkoutEditBlocUpdateSuccessState(successMessage);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutEditBlocUpdateFailureState(message);
      emit(failureState);
    }
  }

  Future<void> _onDeleteEvent(
    WorkoutEditBlocDeleteEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    final loadingState = WorkoutEditBlocLoadingState();
    emit(loadingState);
    try {
      final workoutId = event.workoutId;
      await workoutRepository.delete(workoutId);

      const successMessage = 'Workout deleted';
      const successState = WorkoutEditBlocDeleteSuccessState(successMessage);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutEditBlocDeleteFailureState(message);
      emit(failureState);
    }
  }
}
