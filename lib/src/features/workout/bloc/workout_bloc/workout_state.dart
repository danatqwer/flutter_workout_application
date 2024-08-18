// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

enum WorkoutStateStatus { initial, loading, failure, success }

sealed class WorkoutState extends Equatable {
  final WorkoutStateStatus status;

  const WorkoutState(this.status);

  @override
  List<Object?> get props => [];
}

final class WorkoutInitialState extends WorkoutState {
  const WorkoutInitialState() : super(WorkoutStateStatus.initial);
}

final class WorkoutLoadingState extends WorkoutState {
  const WorkoutLoadingState() : super(WorkoutStateStatus.loading);
}

final class WorkoutFailureState extends WorkoutState {
  final String message;

  const WorkoutFailureState(
    this.message,
  ) : super(WorkoutStateStatus.failure);
}

final class WorkoutSuccessState extends WorkoutState {
  final Workout workout;
  final int selectedIndex;
  final bool workoutStarted;

  const WorkoutSuccessState({
    required this.workout,
    this.selectedIndex = 0,
    this.workoutStarted = false,
  }) : super(WorkoutStateStatus.success);
  
  @override
  List<Object?> get props => [];

  WorkoutSuccessState copyWith({
    Workout? workout,
    int? selectedIndex,
    bool? workoutStarted,
  }) {
    return WorkoutSuccessState(
      workout: workout ?? this.workout,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      workoutStarted: workoutStarted ?? this.workoutStarted,
    );
  }
}
