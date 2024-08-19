import 'package:equatable/equatable.dart';

sealed class WorkoutListEvent extends Equatable {
  const WorkoutListEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutsInitializeEvent extends WorkoutListEvent {}

class WorkoutListWorkoutPressedEvent extends WorkoutListEvent {
  final String? workoutId;

  const WorkoutListWorkoutPressedEvent({
    required this.workoutId,
  });
}
