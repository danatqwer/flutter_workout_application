enum ExerciseType {
  undefined,
  repeats,
  timer,
}

class ExerciseTypeAdapter {
  static ExerciseType fromName(String name) {
    return switch (name) {
      'repeats' => ExerciseType.repeats,
      'timer' => ExerciseType.timer,
      _ => ExerciseType.undefined,
    };
  }
}
