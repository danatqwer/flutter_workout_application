import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

sealed class WorkoutItemEditBlocEvent {
  const WorkoutItemEditBlocEvent();
}

final class WorkoutItemEditBlocInitializeEvent
    extends WorkoutItemEditBlocEvent {}

final class WorkoutItemEditBlocSaveEvent extends WorkoutItemEditBlocEvent {
  final WorkoutItem workoutItem;

  const WorkoutItemEditBlocSaveEvent(this.workoutItem);
}

final class WorkoutItemEditBlocRemoveEvent extends WorkoutItemEditBlocEvent {
  final WorkoutItem workoutItem;

  const WorkoutItemEditBlocRemoveEvent(this.workoutItem);
}
