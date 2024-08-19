import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutListState extends Equatable {
  const WorkoutListState();

  @override
  List<Object?> get props => [];
}

final class WorkoutListInitialState extends WorkoutListState {}

final class WorkoutListLoadingState extends WorkoutListState {}

final class WorkoutListFailureState extends WorkoutListState {
  final String message;

  const WorkoutListFailureState(this.message);
}

final class WorkoutListSuccessState extends WorkoutListState {
  final List<Workout> workouts;

  const WorkoutListSuccessState(this.workouts);

  @override
  List<Workout> get props => workouts;
}
