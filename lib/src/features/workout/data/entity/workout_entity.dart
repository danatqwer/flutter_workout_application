import 'package:flutter/foundation.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/exercise_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/rest_timer_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_undefined_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

class WorkoutEntity {
  final String id;
  final String name;
  final List<WorkoutItemEntity> items;

  const WorkoutEntity({
    required this.id,
    required this.name,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'items': items.map((x) => x.toMap()).where((e) => e != null).toList(),
    };
  }

  factory WorkoutEntity.fromMap(Map<String, dynamic> map) {
    WorkoutItemEntity toItemsElement(Map<String, dynamic> eMap) {
      final typeName = eMap['itemType'];
      final type = WorkoutItemTypeAdapter.fromName(typeName);
      return switch (type) {
        WorkoutItemType.exercise => ExerciseEntity.fromMap(eMap),
        WorkoutItemType.restTimer => RestTimerEntity.fromMap(eMap),
        _ => const WorkoutItemUndefinedEntity(),
      };
    }

    bool isNotUndefined(WorkoutItemEntity e) {
      return e.runtimeType != WorkoutItemUndefinedEntity;
    }

    final itemsMapList = List<Map<String, dynamic>>.from(map['items']);
    final itemsUnfilteredMap = itemsMapList.map(toItemsElement);
    final itemsMap = itemsUnfilteredMap.where(isNotUndefined);
    final items = itemsMap.toList();

    return WorkoutEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      items: items,
    );
  }
  
  @override
  String toString() => 'WorkoutEntity(id: $id, name: $name, items: $items)';

  @override
  bool operator ==(covariant WorkoutEntity other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.items, items);
  }

  @override
  int get hashCode => name.hashCode ^ items.hashCode;
}
