import 'package:workout_repository/src/entities/workout_item_entity.dart';

import '../enums/workout_item_type.dart';

abstract class WorkoutItem {
  final WorkoutItemType itemType;

  const WorkoutItem({required this.itemType});

  WorkoutItemEntity toEntity();
}
