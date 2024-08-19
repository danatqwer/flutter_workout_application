import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutAddBlocEvent extends Equatable {
  const WorkoutAddBlocEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutAddBlocAddEvent extends WorkoutAddBlocEvent {
  final Workout workout;

  const WorkoutAddBlocAddEvent(this.workout);
}
