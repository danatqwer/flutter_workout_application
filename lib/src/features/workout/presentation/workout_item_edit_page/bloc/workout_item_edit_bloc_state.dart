import 'package:flutter/foundation.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_item_edit_bloc_state.freezed.dart';

@freezed
sealed class WorkoutItemEditBlocState with _$WorkoutItemEditBlocState {
  const factory WorkoutItemEditBlocState({
    @Default(true) bool loading,
    String? errorMessage,
    String? successMessage,
    WorkoutItem? workoutItem,
  }) = _WorkoutItemEditBlocState;
}
