import 'package:equatable/equatable.dart';

sealed class WorkoutBlocEvent extends Equatable {
  const WorkoutBlocEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutBlocInitializeEvent extends WorkoutBlocEvent {}
