import 'package:flutter/foundation.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/exercise_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/rest_timer_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/workout_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';
import 'package:uuid/uuid.dart';

class Workout {
  final String id;
  final String name;
  final List<WorkoutItem> items;

  const Workout({
    required this.id,
    required this.name,
    required this.items,
  });

  factory Workout.createWithUID({
    required String name,
    required List<WorkoutItem> items,
  }) {
    const uuid = Uuid();
    final id = uuid.v7();
    return Workout(
      id: id,
      name: name,
      items: [],
    );
  }

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

  Workout copyWith({
    String? id,
    String? name,
    List<WorkoutItem>? items,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      items: items ?? this.items,
    );
  }
}
