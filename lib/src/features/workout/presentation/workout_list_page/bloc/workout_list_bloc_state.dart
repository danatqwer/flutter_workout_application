import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_list_bloc_state.freezed.dart';

@freezed
sealed class WorkoutListBlocState with _$WorkoutListBlocState {
  const factory WorkoutListBlocState({
    @Default(true) bool loading,
    String? errorMessage,
    @Default(<Workout>[]) List<Workout> workouts,
  }) = _WorkoutListBlocState;
}
