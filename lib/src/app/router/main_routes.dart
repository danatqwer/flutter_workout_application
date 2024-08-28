class MainRoutes {
  // Name
  static const workoutListName = 'workout_list';
  static const workoutName = 'workout';
  static const workoutAddName = 'workout_add';
  static const workoutEditName = 'workout_edit';
  static const workoutItemAddName = 'workout_item_add';

  // Path
  static const workoutListPath = '/$workoutListName';
  static const workoutPath = '/$workoutListName/$workoutName';
  static const workoutAddPath = '/$workoutListName/$workoutAddName';
  static const workoutEditPath =
      '/$workoutListName/$workoutName/$workoutEditName';
  static const workoutItemAddPath =
      '/$workoutListName/$workoutName/$workoutEditName/$workoutItemAddName';
}
