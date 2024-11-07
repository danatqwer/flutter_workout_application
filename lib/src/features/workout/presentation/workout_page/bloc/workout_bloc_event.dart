import 'package:equatable/equatable.dart';

sealed class WorkoutBlocEvent extends Equatable {
  const WorkoutBlocEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutBlocInitializeEvent extends WorkoutBlocEvent {}

class WorkoutBlocNextEvent extends WorkoutBlocEvent {}

class WorkoutBlocPauseEvent extends WorkoutBlocEvent {}

class WorkoutBlocResumeEvent extends WorkoutBlocEvent {}
