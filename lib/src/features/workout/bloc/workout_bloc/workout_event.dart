import 'package:equatable/equatable.dart';

sealed class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutInitializeEvent extends WorkoutEvent {}
