import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';

import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc_state.dart';

class WorkoutBloc extends Bloc<WorkoutBlocEvent, WorkoutBlocState> {
  final GetWorkoutUseCase getWorkoutUseCase;

  WorkoutBloc({
    required this.getWorkoutUseCase,
  }) : super(const WorkoutBlocState()) {
    on<WorkoutBlocEvent>(
      (event, emit) async {
        if (event is WorkoutBlocInitializeEvent) {
          await _onInitializeWorkout(emit);
        } else if (event is WorkoutBlocNextEvent) {
          _onWorkoutNextEvent(emit);
        } else if (event is WorkoutBlocPauseEvent) {
          _onWorkoutPauseEvent(emit);
        } else if (event is WorkoutBlocResumeEvent) {
          _onWorkoutResumeEvent(emit);
        }
      },
    );

    add(WorkoutBlocInitializeEvent());
  }

  Future<void> _onInitializeWorkout(Emitter<WorkoutBlocState> emit) async {
    try {
      final workout = await getWorkoutUseCase.execute();
      emit(state.copyWith(
        workoutStarted: true,
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onWorkoutNextEvent(Emitter<WorkoutBlocState> emit) {
    try {
      if (state.selectedIndex < state.workout.items.length) {
        emit(state.copyWith(
          selectedIndex: state.selectedIndex + 1,
          loading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onWorkoutPauseEvent(Emitter<WorkoutBlocState> emit) {
    try {
      emit(state.copyWith(
        workoutPaused: true,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onWorkoutResumeEvent(Emitter<WorkoutBlocState> emit) {
    try {
      emit(state.copyWith(
        workoutPaused: false,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
