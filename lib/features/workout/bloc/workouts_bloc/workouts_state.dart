import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

enum WorkoutsStateStatus { initial, loading, failure, success }

sealed class WorkoutsState extends Equatable {
  final WorkoutsStateStatus status;

  const WorkoutsState(
    this.status,
  );

  @override
  List<Object?> get props => [];
}

final class WorkoutsInitialState extends WorkoutsState {
  const WorkoutsInitialState() : super(WorkoutsStateStatus.initial);
}

final class WorkoutsLoadingState extends WorkoutsState {
  const WorkoutsLoadingState() : super(WorkoutsStateStatus.loading);
}

final class WorkoutsFailureState extends WorkoutsState {
  final String message;

  const WorkoutsFailureState(this.message) : super(WorkoutsStateStatus.failure);
}

final class WorkoutsSuccessState extends WorkoutsState {
  final List<Workout> workouts;

  const WorkoutsSuccessState(this.workouts)
      : super(WorkoutsStateStatus.success);

  @override
  List<Workout> get props => workouts;
}
