import 'package:flutter_workout_application/src/features/workout/data/entity/workout_item_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/exercise_type.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';

class ExerciseEntity extends WorkoutItemEntity {
  final String id;
  final String name;
  final ExerciseType type;
  final int value;

  const ExerciseEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
  }) : super(itemType: WorkoutItemType.exercise);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type.name,
      'value': value,
      'itemType': itemType.name,
    };
  }

  factory ExerciseEntity.fromMap(Map<String, dynamic> map) {
    return ExerciseEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      type: ExerciseTypeAdapter.fromName(map['type']),
      value: map['value'] as int,
    );
  }

  @override
  String toString() {
    return 'ExerciseEntity(id: $id, name: $name, type: $type, value: $value)';
  }

  @override
  bool operator ==(covariant ExerciseEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.value == value;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ type.hashCode ^ value.hashCode;
  }
}
