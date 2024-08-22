import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

abstract class WorkoutItem {
  final WorkoutItemType itemType;

  const WorkoutItem({required this.itemType});

  WorkoutItemEntity toEntity();
}
