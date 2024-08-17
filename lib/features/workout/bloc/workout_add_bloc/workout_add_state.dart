import 'package:equatable/equatable.dart';

enum WorkoutAddStatus { initial, loading, failure, success }

sealed class WorkoutAddState extends Equatable {
  final WorkoutAddStatus status;

  const WorkoutAddState(this.status);

  @override
  List<Object?> get props => [];
}

final class WorkoutAddInitial extends WorkoutAddState {
  const WorkoutAddInitial() : super(WorkoutAddStatus.initial);
}

final class WorkoutAddLoading extends WorkoutAddState {
  const WorkoutAddLoading() : super(WorkoutAddStatus.loading);
}

final class WorkoutAddFailure extends WorkoutAddState {
  final String message;

  const WorkoutAddFailure(this.message) : super(WorkoutAddStatus.failure);
}

final class WorkoutAddSuccess extends WorkoutAddState {
  final String message;

  const WorkoutAddSuccess(this.message) : super(WorkoutAddStatus.success);
}
