import 'dart:developer';

import 'package:workout_repository/workout_repository.dart';
import 'package:bloc/bloc.dart';

import 'workout_add_bloc_event.dart';
import 'workout_add_bloc_state.dart';

class WorkoutAddBloc extends Bloc<WorkoutAddBlocEvent, WorkoutAddBlocState> {
  final WorkoutRepository workoutRepository;

  WorkoutAddBloc(this.workoutRepository)
      : super(const WorkoutAddBlocInitialState()) {
    on<WorkoutAddBlocAddEvent>((event, emit) async {
      const loadingState = WorkoutAddBlocLoadingState();
      emit(loadingState);
      try {
        await workoutRepository.set(event.workout);
        const successState =
            WorkoutAddBlocSuccessState('Workout added successfully.');
        emit(successState);
      } catch (e) {
        final message = e.toString();
        log(message);
        final failureState = WorkoutAddBlocFailureState(message);
        emit(failureState);
      }
    });
  }
}
