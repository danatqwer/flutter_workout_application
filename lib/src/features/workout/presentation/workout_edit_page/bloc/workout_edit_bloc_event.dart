import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

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

final class WorkoutEditBlocWorkoutItemPressedEvent
    extends WorkoutEditBlocEvent {
  final String workoutItemId;

  const WorkoutEditBlocWorkoutItemPressedEvent(this.workoutItemId);
}
