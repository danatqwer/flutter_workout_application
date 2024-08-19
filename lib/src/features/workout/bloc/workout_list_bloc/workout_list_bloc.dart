import 'package:bloc/bloc.dart';
import 'package:workout_repository/workout_repository.dart';

import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';

import 'workout_list_event.dart';
import 'workout_list_state.dart';

class WorkoutListBloc extends Bloc<WorkoutListEvent, WorkoutListState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdService;

  WorkoutListBloc({
    required this.workoutRepository,
    required this.workoutIdService,
  }) : super(WorkoutListInitialState()) {
    on<WorkoutListEvent>(
      (event, emit) async {
        if (event is WorkoutsInitializeEvent) {
          await _onInitializeWorkouts(emit);
        } else if (event is WorkoutListWorkoutPressedEvent) {
          await _onWorkoutPressed(event, emit);
        }
      },
    );

    add(WorkoutsInitializeEvent());
  }

  Future<void> _onInitializeWorkouts(Emitter<WorkoutListState> emit) async {
    final loadingState = WorkoutListLoadingState();
    emit(loadingState);
    try {
      final workouts = await workoutRepository.getList();
      final successState = WorkoutListSuccessState(workouts);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutListFailureState(message);
      emit(failureState);
    }
  }

  Future<void> _onWorkoutPressed(
    WorkoutListWorkoutPressedEvent event,
    Emitter<WorkoutListState> emit,
  ) async {
    try {
      final id = event.workoutId;
      if (id == null) {
        throw ArgumentError.notNull('Workout id');
      }
      await workoutIdService.set(id);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutListFailureState(message);
      emit(failureState);
    }
  }
}
