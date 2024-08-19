import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_state.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdService;

  WorkoutBloc({
    required this.workoutRepository,
    required this.workoutIdService,
  }) : super(WorkoutInitialState()) {
    on<WorkoutEvent>(
      (event, emit) async {
        if (event is WorkoutInitializeEvent) {
          await _onInitializeWorkout(emit);
        }
      },
    );

    add(WorkoutInitializeEvent());
  }

  Future<void> _onInitializeWorkout(Emitter<WorkoutState> emit) async {
    final loadingState = WorkoutLoadingState();
    emit(loadingState);
    try {
      final id = await workoutIdService.get();
      final workout = await workoutRepository.get(id);
      final successState = WorkoutSuccessState(workout: workout);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      log(message);
      final failureState = WorkoutFailureState(message);
      emit(failureState);
    }
  }
}
