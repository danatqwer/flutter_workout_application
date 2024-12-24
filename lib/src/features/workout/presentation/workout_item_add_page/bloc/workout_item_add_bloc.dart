import 'package:bloc/bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/get_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/set_workout_edit_usecase.dart';

import 'workout_item_add_bloc_event.dart';
import 'workout_item_add_bloc_state.dart';

class WorkoutItemAddBloc
    extends Bloc<WorkoutItemAddBlocEvent, WorkoutItemAddBlocState> {
  final GetWorkoutEditUseCase getWorkoutEditUseCase;
  final SetWorkoutEditUseCase setWorkoutEditUseCase;

  WorkoutItemAddBloc({
    required this.getWorkoutEditUseCase,
    required this.setWorkoutEditUseCase,
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
      final workout = await getWorkoutEditUseCase.execute();

      if (workout == null) {
        throw ArgumentError.notNull('workout');
      }

      workout.items.add(event.workoutItem);
      await setWorkoutEditUseCase.execute(workout);

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
