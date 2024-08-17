import '../enums/workout_item_type.dart';

abstract class WorkoutItemEntity {
  final WorkoutItemType itemType;

  const WorkoutItemEntity({required this.itemType});

  Map<String, dynamic>? toMap();

}