import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_bloc_state.freezed.dart';

@freezed
sealed class WorkoutBlocState with _$WorkoutBlocState {
  const factory WorkoutBlocState({
    @Default(true) bool loading,
    String? errorMessage,
    @Default(Workout(
      id: '',
      name: '',
      items: [],
    ))
    Workout workout,
    @Default(0) int selectedIndex,
    @Default(false) bool workoutStarted,
    @Default(false) bool workoutPaused,
  }) = _WorkoutBlocState;
}
