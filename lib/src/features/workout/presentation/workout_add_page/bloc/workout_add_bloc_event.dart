import 'package:equatable/equatable.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

sealed class WorkoutAddBlocEvent extends Equatable {
  const WorkoutAddBlocEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutAddBlocAddEvent extends WorkoutAddBlocEvent {
  final Workout workout;

  const WorkoutAddBlocAddEvent(this.workout);
}
