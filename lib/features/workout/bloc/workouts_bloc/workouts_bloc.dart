import 'package:workout_repository/workout_repository.dart';
import 'package:bloc/bloc.dart';

import 'workouts_event.dart';
import 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  final WorkoutRepository workoutRepository;

  WorkoutsBloc(this.workoutRepository) : super(const WorkoutsInitialState()) {
    on<WorkoutsEvent>((event, emit) async {
      const loadingState = WorkoutsLoadingState();
      emit(loadingState);
      try {
        final workouts = await workoutRepository.getList();
        final successState = WorkoutsSuccessState(workouts);
        emit(successState);
      } catch (e) {
        final failureState = WorkoutsFailureState(e.toString());
        emit(failureState);
      }
    });
  }
}
