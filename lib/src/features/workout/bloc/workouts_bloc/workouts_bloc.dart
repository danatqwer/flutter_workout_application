import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

import 'package:flutter_workout_application/src/app/router/utils/constants/main_route_names.dart';
import 'package:flutter_workout_application/src/features/workout/service/workout_service/workout_id_service.dart';

import 'workouts_event.dart';
import 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdService;

  WorkoutsBloc({
    required this.workoutRepository,
    required this.workoutIdService,
  }) : super(const WorkoutsInitialState()) {
    on<WorkoutsEvent>(
      (event, emit) async {
        if (event is WorkoutsInitializeEvent) {
          await _onInitializeWorkouts(emit);
        } else if (event is WorkoutsWorkoutPressedEvent) {
          await _onWorkoutPressed(event, emit);
        }
      },
    );
  }

  Future<void> _onInitializeWorkouts(Emitter<WorkoutsState> emit) async {
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
  }

  Future<void> _onWorkoutPressed(
    WorkoutsWorkoutPressedEvent event,
    Emitter<WorkoutsState> emit,
  ) async {
    try {
      final id = event.workoutId;
      final context = event.context;

      if (id == null) {
        throw ArgumentError.notNull('Workout id');
      }

      await workoutIdService.set(id);
      if (context.mounted) {
        context.go(MainRouteNames.workout);
      }
    } catch (e) {
      final context = event.context;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }
}
