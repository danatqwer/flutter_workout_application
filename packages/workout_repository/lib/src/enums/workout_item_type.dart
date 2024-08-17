enum WorkoutItemType {
  undefined,
  exercise,
  restTimer,
}

class WorkoutItemTypeAdapter {
  static WorkoutItemType fromName(String name) {
    return switch (name) {
      'exercise' => WorkoutItemType.exercise,
      'restTimer' => WorkoutItemType.restTimer,
      _ => WorkoutItemType.undefined,
    };
  }
}
