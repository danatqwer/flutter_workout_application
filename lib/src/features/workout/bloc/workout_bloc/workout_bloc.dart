import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutBloc extends Bloc<WorkoutBlocEvent, WorkoutBlocState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdService;

  WorkoutBloc({
    required this.workoutRepository,
    required this.workoutIdService,
  }) : super(WorkoutBlocInitialState()) {
    on<WorkoutBlocEvent>(
      (event, emit) async {
        if (event is WorkoutBlocInitializeEvent) {
          await _onInitializeWorkout(emit);
        }
      },
    );

    add(WorkoutBlocInitializeEvent());
  }

  Future<void> _onInitializeWorkout(Emitter<WorkoutBlocState> emit) async {
    final loadingState = WorkoutBlocLoadingState();
    emit(loadingState);
    try {
      final id = await workoutIdService.get();
      final workout = await workoutRepository.get(id);
      final successState = WorkoutBlocSuccessState(workout: workout);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutBlocFailureState(message);
      emit(failureState);
    }
  }
}
