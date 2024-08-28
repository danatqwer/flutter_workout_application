import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_item_add_bloc_state.freezed.dart';

@freezed
sealed class WorkoutItemAddBlocState with _$WorkoutItemAddBlocState {
  const factory WorkoutItemAddBlocState({
    @Default(true) bool loading,
    String? errorMessage,
    String? successMessage,
  }) = _WorkoutItemAddBlocState;
}
