import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

sealed class WorkoutItemEditBlocEvent {
  const WorkoutItemEditBlocEvent();
}

final class WorkoutItemEditBlocEditEvent extends WorkoutItemEditBlocEvent {
  final WorkoutItem workoutItem;

  const WorkoutItemEditBlocEditEvent(this.workoutItem);
}

final class WorkoutItemEditBlocDeleteEvent extends WorkoutItemEditBlocEvent {
  final WorkoutItem workoutItem;

  const WorkoutItemEditBlocDeleteEvent(this.workoutItem);
}
