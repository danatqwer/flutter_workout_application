import 'package:equatable/equatable.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

sealed class WorkoutEditBlocState extends Equatable {
  const WorkoutEditBlocState();

  @override
  List<Object> get props => [];
}

// Initialize workout
final class WorkoutEditBlocInitializeState extends WorkoutEditBlocState {
  const WorkoutEditBlocInitializeState();
}

final class WorkoutEditBlocInitialState
    extends WorkoutEditBlocInitializeState {}

final class WorkoutEditBlocLoadingState
    extends WorkoutEditBlocInitializeState {}

final class WorkoutEditBlocFailureState extends WorkoutEditBlocInitializeState {
  final String message;

  const WorkoutEditBlocFailureState(this.message);
}

final class WorkoutEditBlocSuccessState extends WorkoutEditBlocInitializeState {
  final Workout workout;

  const WorkoutEditBlocSuccessState(this.workout);
}

// Save workout
final class WorkoutEditBlocSaveState extends WorkoutEditBlocState {
  const WorkoutEditBlocSaveState();
}

final class WorkoutEditBlocSaveLoadingState extends WorkoutEditBlocSaveState {}

final class WorkoutEditBlocSaveFailureState extends WorkoutEditBlocSaveState {
  final String message;

  const WorkoutEditBlocSaveFailureState(this.message);
}

final class WorkoutEditBlocSaveSuccessState extends WorkoutEditBlocSaveState {
  final String message;

  const WorkoutEditBlocSaveSuccessState(this.message);
}

// Delete workout
final class WorkoutEditBlocDeleteLoadingState extends WorkoutEditBlocState {}

final class WorkoutEditBlocDeleteFailureState extends WorkoutEditBlocState {
  final String message;

  const WorkoutEditBlocDeleteFailureState(this.message);
}

final class WorkoutEditBlocDeleteSuccessState extends WorkoutEditBlocState {
  final String message;

  const WorkoutEditBlocDeleteSuccessState(this.message);
}
