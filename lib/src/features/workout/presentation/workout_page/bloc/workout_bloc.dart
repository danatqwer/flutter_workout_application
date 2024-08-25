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
        }
      },
    );

    add(WorkoutBlocInitializeEvent());
  }

  Future<void> _onInitializeWorkout(Emitter<WorkoutBlocState> emit) async {
    try {
      final workout = await getWorkoutUseCase.execute();
      emit(state.copyWith(
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
}
