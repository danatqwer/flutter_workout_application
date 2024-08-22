import 'package:bloc/bloc.dart';

import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_list_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/remove_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/set_workout_id_usecase.dart';

import 'workout_list_bloc_event.dart';
import 'workout_list_bloc_state.dart';

class WorkoutListBloc extends Bloc<WorkoutListBlocEvent, WorkoutListBlocState> {
  final GetWorkoutListUsecase getWorkoutListUseCase;
  final SetWorkoutIdUsecase setWorkoutIdUseCase;
  final RemoveWorkoutIdUsecase removeWorkoutIdUseCase;

  WorkoutListBloc({
    required this.getWorkoutListUseCase,
    required this.setWorkoutIdUseCase,
    required this.removeWorkoutIdUseCase,
  }) : super(const WorkoutListBlocState()) {
    on<WorkoutListBlocEvent>(
      (event, emit) async {
        if (event is WorkoutListBlocInitializeEvent) {
          await _onInitializeWorkouts(emit);
        } else if (event is WorkoutListBlocWorkoutPressedEvent) {
          await _onWorkoutPressed(event, emit);
        }
      },
    );

    add(WorkoutListBlocInitializeEvent());
  }

  Future<void> _onInitializeWorkouts(Emitter<WorkoutListBlocState> emit) async {
    try {
      await removeWorkoutIdUseCase.execute();

      final workoutList = await getWorkoutListUseCase.execute();
      emit(state.copyWith(
        loading: false,
        workouts: workoutList,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onWorkoutPressed(
    WorkoutListBlocWorkoutPressedEvent event,
    Emitter<WorkoutListBlocState> emit,
  ) async {
    try {
      final workoutId = event.workoutId;
      await setWorkoutIdUseCase.execute(workoutId);
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
