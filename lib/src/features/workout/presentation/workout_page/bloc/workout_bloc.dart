import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';

class WorkoutBloc extends Bloc<WorkoutBlocEvent, WorkoutBlocState> {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdRepository;

  WorkoutBloc({
    required this.workoutRepository,
    required this.workoutIdRepository,
  }) : super(WorkoutBlocInitialState()) {
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
    final loadingState = WorkoutBlocLoadingState();
    emit(loadingState);
    try {
      final id = await workoutIdRepository.get();
      final workout = await workoutRepository.get(id);
      final successState = WorkoutBlocSuccessState(workout: workout);
      emit(successState);
    } catch (e) {
      final message = e.toString();
      final failureState = WorkoutBlocFailureState(message);
      emit(failureState);
    }
  }
}
