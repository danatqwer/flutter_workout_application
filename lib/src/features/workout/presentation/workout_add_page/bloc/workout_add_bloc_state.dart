import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_add_bloc_state.freezed.dart';

@freezed
sealed class WorkoutAddBlocState with _$WorkoutAddBlocState {
 const factory  WorkoutAddBlocState({
    @Default(true) bool loading,
    String? errorMessage,
    String? successMessage,
  })= _WorkoutAddBlocState;
}
