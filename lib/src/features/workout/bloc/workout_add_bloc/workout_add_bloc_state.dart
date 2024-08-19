import 'package:equatable/equatable.dart';

sealed class WorkoutAddBlocState extends Equatable {
  const WorkoutAddBlocState();

  @override
  List<Object?> get props => [];
}

final class WorkoutAddBlocInitialState extends WorkoutAddBlocState {
  const WorkoutAddBlocInitialState();
}

final class WorkoutAddBlocLoadingState extends WorkoutAddBlocState {
  const WorkoutAddBlocLoadingState();
}

final class WorkoutAddBlocFailureState extends WorkoutAddBlocState {
  final String message;

  const WorkoutAddBlocFailureState(this.message);
}

final class WorkoutAddBlocSuccessState extends WorkoutAddBlocState {
  final String message;

  const WorkoutAddBlocSuccessState(this.message);
}
