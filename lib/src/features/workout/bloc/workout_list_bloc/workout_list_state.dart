import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

enum WorkoutListStateStatus { initial, loading, failure, success }

sealed class WorkoutListState extends Equatable {
  final WorkoutListStateStatus status;

  const WorkoutListState(this.status);

  @override
  List<Object?> get props => [];
}

final class WorkoutListInitialState extends WorkoutListState {
  const WorkoutListInitialState() : super(WorkoutListStateStatus.initial);
}

final class WorkoutListLoadingState extends WorkoutListState {
  const WorkoutListLoadingState() : super(WorkoutListStateStatus.loading);
}

final class WorkoutListFailureState extends WorkoutListState {
  final String message;

  const WorkoutListFailureState(
    this.message,
  ) : super(WorkoutListStateStatus.failure);
}

final class WorkoutListSuccessState extends WorkoutListState {
  final List<Workout> workouts;

  const WorkoutListSuccessState(
    this.workouts,
  ) : super(WorkoutListStateStatus.success);

  @override
  List<Workout> get props => workouts;
}
