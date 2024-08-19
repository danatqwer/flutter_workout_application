import 'package:equatable/equatable.dart';

sealed class WorkoutAddState extends Equatable {
  const WorkoutAddState();

  @override
  List<Object?> get props => [];
}

final class WorkoutAddInitial extends WorkoutAddState {
  const WorkoutAddInitial();
}

final class WorkoutAddLoading extends WorkoutAddState {
  const WorkoutAddLoading();
}

final class WorkoutAddFailure extends WorkoutAddState {
  final String message;

  const WorkoutAddFailure(this.message);
}

final class WorkoutAddSuccess extends WorkoutAddState {
  final String message;

  const WorkoutAddSuccess(this.message);
}
