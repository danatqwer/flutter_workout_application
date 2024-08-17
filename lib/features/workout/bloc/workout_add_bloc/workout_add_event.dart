import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutAddEvent extends Equatable {
  const WorkoutAddEvent();

  @override
  List<Object?> get props => [];
}

final class AddWorkoutEvent extends WorkoutAddEvent {
  final Workout workout;

  const AddWorkoutEvent(this.workout);
}
