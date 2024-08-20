import 'package:workout_repository/src/entities/exercise_entity.dart';

import '../enums/exercise_type.dart';
import '../enums/workout_item_type.dart';
import 'workout_item.dart';

class Exercise extends WorkoutItem {
  final String id;
  final String name;
  final ExerciseType type;
  final int value;

  const Exercise({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
  }) : super(itemType: WorkoutItemType.exercise);

  factory Exercise.fromEntity(ExerciseEntity entity) {
    return Exercise(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      value: entity.value,
    );
  }

  @override
  ExerciseEntity toEntity() {
    return ExerciseEntity(
      id: id,
      name: name,
      type: type,
      value: value,
    );
  }

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, type: $type, value: $value)';
  }

  @override
  bool operator ==(covariant Exercise other) {
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

  Exercise copyWith({
    String? id,
    String? name,
    ExerciseType? type,
    int? value,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }
}
