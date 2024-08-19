import 'package:flutter/foundation.dart';

import 'package:workout_repository/src/entities/exercise_entity.dart';
import 'package:workout_repository/src/entities/rest_timer_entity.dart';
import 'package:workout_repository/src/entities/workout_entity.dart';
import 'package:workout_repository/src/entities/workout_item_entity.dart';
import 'package:workout_repository/src/enums/workout_item_type.dart';
import 'package:workout_repository/src/models/exercise.dart';
import 'package:workout_repository/src/models/rest_timer.dart';

import 'workout_item.dart';

class Workout {
  final String id;
  final String name;
  final List<WorkoutItem> items;

  const Workout({
    required this.id,
    required this.name,
    required this.items,
  });

  factory Workout.fromEntity(WorkoutEntity entity) {
    return Workout(
      id: entity.id,
      name: entity.name,
      items: entity.items
          .map((WorkoutItemEntity entity) => switch (entity.itemType) {
                WorkoutItemType.undefined =>
                  throw Exception('Undefined workout item'),
                WorkoutItemType.exercise =>
                  Exercise.fromEntity(entity as ExerciseEntity),
                WorkoutItemType.restTimer =>
                  RestTimer.fromEntity(entity as RestTimerEntity),
              })
          .toList(),
    );
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      id: id,
      name: name,
      items: items.map((WorkoutItem e) => e.toEntity()).toList(),
    );
  }

  @override
  String toString() => 'Workout(id: $id, name: $name, items: $items)';

  @override
  bool operator ==(covariant Workout other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ items.hashCode;
}
