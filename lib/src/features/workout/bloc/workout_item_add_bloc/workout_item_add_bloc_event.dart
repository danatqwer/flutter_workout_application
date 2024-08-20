import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutItemAddBlocEvent extends Equatable {
  const WorkoutItemAddBlocEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutItemAddBlocAddEvent extends WorkoutItemAddBlocEvent {
  final WorkoutItem workoutItem;

  const WorkoutItemAddBlocAddEvent(this.workoutItem);
}
