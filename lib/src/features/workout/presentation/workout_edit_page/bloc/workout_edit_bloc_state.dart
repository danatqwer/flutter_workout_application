import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_edit_bloc_state.freezed.dart';

sealed class WorkoutEditBlocState {}

// Initialize workout
@freezed
sealed class WorkoutEditBlocInitializeState extends WorkoutEditBlocState
    with _$WorkoutEditBlocInitializeState {
  const factory WorkoutEditBlocInitializeState({
    @Default(true) bool loading,
    String? errorMessage,
    @Default(Workout(
      id: '',
      name: '',
      items: [],
    ))
    Workout workout,
  }) = _WorkoutEditBlocInitializeState;
}

// Save workout state
@freezed
sealed class WorkoutEditBlocSaveState extends WorkoutEditBlocState
    with _$WorkoutEditBlocSaveState {
  const factory WorkoutEditBlocSaveState({
    @Default(true) bool loading,
    String? errorMessage,
    String? successMessage,
  }) = _WorkoutEditBlocSaveState;
}

// Delete workout state
@freezed
sealed class WorkoutEditBlocDeleteState extends WorkoutEditBlocState
    with _$WorkoutEditBlocDeleteState {
  const factory WorkoutEditBlocDeleteState({
    @Default(true) bool loading,
    String? errorMessage,
    String? successMessage,
  }) = _WorkoutEditBlocDeleteState;
}
