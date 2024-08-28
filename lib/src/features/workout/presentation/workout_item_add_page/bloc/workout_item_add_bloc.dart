import 'package:bloc/bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/update_workout_usecase.dart';

import 'workout_item_add_bloc_event.dart';
import 'workout_item_add_bloc_state.dart';

class WorkoutItemAddBloc
    extends Bloc<WorkoutItemAddBlocEvent, WorkoutItemAddBlocState> {
  final GetWorkoutUseCase getWorkoutUseCase;
  final UpdateWorkoutUseCase updateWorkoutUseCase;

  WorkoutItemAddBloc({
    required this.getWorkoutUseCase,
    required this.updateWorkoutUseCase,
  }) : super(const WorkoutItemAddBlocState()) {
    on<WorkoutItemAddBlocAddEvent>(
      (event, emit) async {
        await _onWorkoutItemAddEvent(event, emit);
      },
    );
  }

  Future<void> _onWorkoutItemAddEvent(
    WorkoutItemAddBlocAddEvent event,
    Emitter<WorkoutItemAddBlocState> emit,
  ) async {
    try {
      final workout = await getWorkoutUseCase.execute();
      workout.items.add(event.workoutItem);
      await updateWorkoutUseCase.execute(workout);

      emit(const WorkoutItemAddBlocState(
        loading: false,
        successMessage: 'Item added successfully.',
      ));
    } catch (e) {
      emit(WorkoutItemAddBlocState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
