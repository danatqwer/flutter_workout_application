import 'package:equatable/equatable.dart';

sealed class WorkoutItemAddBlocState extends Equatable {
  const WorkoutItemAddBlocState();

  @override
  List<Object?> get props => [];
}

final class WorkoutItemAddBlocInitialState extends WorkoutItemAddBlocState {
  const WorkoutItemAddBlocInitialState();
}

final class WorkoutItemAddBlocLoadingState extends WorkoutItemAddBlocState {
  const WorkoutItemAddBlocLoadingState();
}

final class WorkoutItemAddBlocFailureState extends WorkoutItemAddBlocState {
  final String message;

  const WorkoutItemAddBlocFailureState(this.message);
}

final class WorkoutItemAddBlocSuccessState extends WorkoutItemAddBlocState {
  final String message;

  const WorkoutItemAddBlocSuccessState(this.message);
}
