import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutEditBlocState {
  const WorkoutEditBlocState();
}

// Initialize workout
final class WorkoutEditBlocInitialState extends WorkoutEditBlocState {}

final class WorkoutEditBlocLoadingState extends WorkoutEditBlocState {}

final class WorkoutEditBlocFailureState extends WorkoutEditBlocState {
  final String message;

  const WorkoutEditBlocFailureState(this.message);
}

final class WorkoutEditBlocSuccessState extends WorkoutEditBlocState {
  final Workout workout;

  WorkoutEditBlocSuccessState(this.workout);
}

// Update workout
final class WorkoutEditBlocUpdateLoadingState extends WorkoutEditBlocState {}

final class WorkoutEditBlocUpdateFailureState extends WorkoutEditBlocState {
  final String message;

  const WorkoutEditBlocUpdateFailureState(this.message);
}

final class WorkoutEditBlocUpdateSuccessState extends WorkoutEditBlocState {
  final String message;

  const WorkoutEditBlocUpdateSuccessState(this.message);
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
