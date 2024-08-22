import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

abstract class WorkoutItemEntity {
  final WorkoutItemType itemType;

  const WorkoutItemEntity({required this.itemType});

  Map<String, dynamic>? toMap();
}
