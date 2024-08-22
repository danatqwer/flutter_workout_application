import 'package:equatable/equatable.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

sealed class WorkoutItemAddBlocEvent extends Equatable {
  const WorkoutItemAddBlocEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutItemAddBlocAddEvent extends WorkoutItemAddBlocEvent {
  final WorkoutItem workoutItem;

  const WorkoutItemAddBlocAddEvent(this.workoutItem);
}
