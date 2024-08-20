import 'dart:developer';

import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:bloc/bloc.dart';

import 'workout_item_add_bloc_event.dart';
import 'workout_item_add_bloc_state.dart';

class WorkoutItemAddBloc
    extends Bloc<WorkoutItemAddBlocEvent, WorkoutItemAddBlocState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdRepository;

  WorkoutItemAddBloc({
    required this.workoutRepository,
    required this.workoutIdRepository,
  }) : super(const WorkoutItemAddBlocInitialState()) {
    on<WorkoutItemAddBlocAddEvent>(
      (event, emit) async {
        const loadingState = WorkoutItemAddBlocLoadingState();
        emit(loadingState);
        try {
          final workoutId = await workoutIdRepository.get();
          final workout = await workoutRepository.get(workoutId);
          workout.items.add(event.workoutItem);
          await workoutRepository.update(workout);
          const successState =
              WorkoutItemAddBlocSuccessState('Item added successfully.');
          emit(successState);
        } catch (e) {
          final message = e.toString();
          log(message);
          final failureState = WorkoutItemAddBlocFailureState(message);
          emit(failureState);
        }
      },
    );
  }
}
