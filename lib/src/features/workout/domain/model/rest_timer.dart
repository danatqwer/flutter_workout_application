
import 'package:flutter_workout_application/src/features/workout/data/entity/rest_timer_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

import 'workout_item.dart';

class RestTimer extends WorkoutItem {
  final String id;
  final int duration;

  const RestTimer({
    required this.id,
    required this.duration,
  }) : super(itemType: WorkoutItemType.restTimer);

  factory RestTimer.fromEntity(RestTimerEntity entity) {
    return RestTimer(
      id: entity.id,
      duration: entity.duration,
    );
  }

  @override
  RestTimerEntity toEntity() {
    return RestTimerEntity(
      id: id,
      duration: duration,
    );
  }

  @override
  String toString() => 'RestTimer(id: $id, duration: $duration)';

  @override
  bool operator ==(covariant RestTimer other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.duration == duration;
  }

  @override
  int get hashCode => id.hashCode ^ duration.hashCode;

  RestTimer copyWith({
    String? id,
    int? duration,
  }) {
    return RestTimer(
      id: id ?? this.id,
      duration: duration ?? this.duration,
    );
  }
}
