import 'package:equatable/equatable.dart';

sealed class WorkoutAddBlocEvent extends Equatable {
  const WorkoutAddBlocEvent();

  @override
  List<Object?> get props => [];
}

final class WorkoutAddBlocAddEvent extends WorkoutAddBlocEvent {
  final String workoutName;

  const WorkoutAddBlocAddEvent(this.workoutName);
}
