import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

class WorkoutItemUndefinedEntity extends WorkoutItemEntity {
  const WorkoutItemUndefinedEntity()
      : super(itemType: WorkoutItemType.undefined);

  @override
  Map<String, dynamic>? toMap() {
    return null;
  }

  @override
  String toString() => 'WorkoutItemUndefinedEntity()';

  @override
  bool operator ==(covariant WorkoutItemEntity other) {
    if (identical(this, other)) return true;

    return other.itemType == itemType;
  }

  @override
  int get hashCode => itemType.hashCode;
}
