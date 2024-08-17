import 'package:workout_repository/workout_repository.dart';
import 'package:bloc/bloc.dart';

import 'workout_add_event.dart';
import 'workout_add_state.dart';

class WorkoutAddBloc extends Bloc<WorkoutAddEvent, WorkoutAddState> {
  final WorkoutRepository workoutRepository;

  WorkoutAddBloc(this.workoutRepository) : super(const WorkoutAddInitial()) {
    on<AddWorkoutEvent>((event, emit) async {
      const loadingState = WorkoutAddLoading();
      emit(loadingState);
      try {
        await workoutRepository.set(event.workout);
        const successState = WorkoutAddSuccess('Workout added successfully.');
        emit(successState);
      } catch (e) {
        final failureState = WorkoutAddFailure(e.toString());
        emit(failureState);
      }
    });
  }
}
