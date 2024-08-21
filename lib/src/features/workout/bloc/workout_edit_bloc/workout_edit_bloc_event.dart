import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutEditBlocEvent {
  const WorkoutEditBlocEvent();
}

final class WorkoutEditBlocInitializeEvent extends WorkoutEditBlocEvent {}

final class WorkoutEditBlocUpdateEvent extends WorkoutEditBlocEvent {
  final Workout workout;

  const WorkoutEditBlocUpdateEvent(this.workout);
}

final class WorkoutEditBlocSaveEvent extends WorkoutEditBlocEvent {
  final Workout workout;

  const WorkoutEditBlocSaveEvent(this.workout);
}

final class WorkoutEditBlocDeleteEvent extends WorkoutEditBlocEvent {
  final String workoutId;

  const WorkoutEditBlocDeleteEvent(this.workoutId);
}
