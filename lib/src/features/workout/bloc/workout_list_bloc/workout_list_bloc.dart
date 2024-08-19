import 'package:bloc/bloc.dart';
import 'package:workout_repository/workout_repository.dart';

import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';

import 'workout_list_bloc_event.dart';
import 'workout_list_bloc_state.dart';

class WorkoutListBloc extends Bloc<WorkoutListBlocEvent, WorkoutListBlocState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdService;

  WorkoutListBloc({
    required this.workoutRepository,
    required this.workoutIdService,
  }) : super(WorkoutListBlocInitialState()) {
    on<WorkoutListBlocEvent>(
      (event, emit) async {
        if (event is WorkoutListBlocInitializeEvent) {
          await _onInitializeWorkouts(emit);
        } else if (event is WorkoutListBlocWorkoutPressedEvent) {
          await _onWorkoutPressed(event, emit);
        }
      },
    );

    add(WorkoutListBlocInitializeEvent());
  }

  Future<void> _onInitializeWorkouts(Emitter<WorkoutListBlocState> emit) async {
    final loadingState = WorkoutListBlocLoadingState();
    emit(loadingState);
    try {
      final workouts = await workoutRepository.getList();
      final successState = WorkoutListBlocSuccessState(workouts);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutListBlocFailureState(message);
      emit(failureState);
    }
  }

  Future<void> _onWorkoutPressed(
    WorkoutListBlocWorkoutPressedEvent event,
    Emitter<WorkoutListBlocState> emit,
  ) async {
    try {
      final id = event.workoutId;
      if (id == null) {
        throw ArgumentError.notNull('Workout id');
      }
      await workoutIdService.set(id);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutListBlocFailureState(message);
      emit(failureState);
    }
  }
}
