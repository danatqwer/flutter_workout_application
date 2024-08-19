import 'package:equatable/equatable.dart';

sealed class WorkoutListBlocEvent extends Equatable {
  const WorkoutListBlocEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutListBlocInitializeEvent extends WorkoutListBlocEvent {}

class WorkoutListBlocWorkoutPressedEvent extends WorkoutListBlocEvent {
  final String? workoutId;

  const WorkoutListBlocWorkoutPressedEvent({
    required this.workoutId,
  });
}
