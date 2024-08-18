import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class WorkoutsEvent extends Equatable {
  const WorkoutsEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutsInitializeEvent extends WorkoutsEvent {}

class WorkoutsWorkoutPressedEvent extends WorkoutsEvent {
  final BuildContext context;
  final String? workoutId;

  const WorkoutsWorkoutPressedEvent({
    required this.context,
    required this.workoutId,
  });
}
