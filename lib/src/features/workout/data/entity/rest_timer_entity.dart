import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

class RestTimerEntity extends WorkoutItemEntity {
  final String id;
  final int duration;

  const RestTimerEntity({
    required this.id,
    required this.duration,
  }) : super(itemType: WorkoutItemType.restTimer);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'duration': duration,
      'itemType': super.itemType.name,
    };
  }

  factory RestTimerEntity.fromMap(Map<String, dynamic> map) {
    return RestTimerEntity(
      id: map['id'] as String,
      duration: map['duration'] as int,
    );
  }

  @override
  String toString() => 'RestTimerEntity(id: $id, duration: $duration)';

  @override
  bool operator ==(covariant RestTimerEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.duration == duration;
  }

  @override
  int get hashCode => id.hashCode ^ duration.hashCode;
}
