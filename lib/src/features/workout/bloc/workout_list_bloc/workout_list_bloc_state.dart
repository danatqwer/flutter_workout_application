import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';

sealed class WorkoutListBlocState extends Equatable {
  const WorkoutListBlocState();

  @override
  List<Object?> get props => [];
}

final class WorkoutListBlocInitialState extends WorkoutListBlocState {}

final class WorkoutListBlocLoadingState extends WorkoutListBlocState {}

final class WorkoutListBlocFailureState extends WorkoutListBlocState {
  final String message;

  const WorkoutListBlocFailureState(this.message);
}

final class WorkoutListBlocSuccessState extends WorkoutListBlocState {
  final List<Workout> workouts;

  const WorkoutListBlocSuccessState(this.workouts);

  @override
  List<Workout> get props => workouts;
}
