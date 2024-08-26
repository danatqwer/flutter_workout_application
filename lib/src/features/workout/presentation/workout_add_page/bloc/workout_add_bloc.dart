import 'package:bloc/bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/set_workout_usecase.dart';

import 'workout_add_bloc_event.dart';
import 'workout_add_bloc_state.dart';

class WorkoutAddBloc extends Bloc<WorkoutAddBlocEvent, WorkoutAddBlocState> {
  final SetWorkoutUseCase setWorkoutUseCase;

  WorkoutAddBloc({
    required this.setWorkoutUseCase,
  }) : super(const WorkoutAddBlocState()) {
    on<WorkoutAddBlocAddEvent>(
      (event, emit) async {
        await _onWorkoutAdd(event, emit);
      },
    );
  }

  Future<void> _onWorkoutAdd(
    WorkoutAddBlocAddEvent event,
    Emitter<WorkoutAddBlocState> emit,
  ) async {
    try {
      final workout = Workout.createWithUID(
        name: event.workoutName,
        items: [],
      );
      await setWorkoutUseCase.execute(workout);
      emit(const WorkoutAddBlocState(
        loading: false,
        successMessage: 'Workout added successfully.',
      ));
    } catch (e) {
      emit(WorkoutAddBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
