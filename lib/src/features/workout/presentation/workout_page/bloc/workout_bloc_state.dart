import 'package:equatable/equatable.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

sealed class WorkoutBlocState extends Equatable {
  const WorkoutBlocState();

  @override
  List<Object?> get props => [];
}

final class WorkoutBlocInitialState extends WorkoutBlocState {}

final class WorkoutBlocLoadingState extends WorkoutBlocState {}

final class WorkoutBlocFailureState extends WorkoutBlocState {
  final String message;

  const WorkoutBlocFailureState(this.message);
}

final class WorkoutBlocSuccessState extends WorkoutBlocState {
  final Workout workout;
  final int selectedIndex;
  final bool workoutStarted;

  const WorkoutBlocSuccessState({
    required this.workout,
    this.selectedIndex = 0,
    this.workoutStarted = false,
  });

  WorkoutBlocSuccessState copyWith({
    Workout? workout,
    int? selectedIndex,
    bool? workoutStarted,
  }) {
    return WorkoutBlocSuccessState(
      workout: workout ?? this.workout,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      workoutStarted: workoutStarted ?? this.workoutStarted,
    );
  }
}
