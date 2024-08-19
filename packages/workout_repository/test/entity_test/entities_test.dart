import 'package:flutter_test/flutter_test.dart';
import 'package:workout_repository/src/entities/entities.dart';
import 'package:workout_repository/src/enums/enums.dart';

void main() {
  test('Exercise entity: to map, from map', () {
    const entity = ExerciseEntity(
      id: 'x',
      name: 'push ups',
      type: ExerciseType.repeats,
      value: 20,
    );

    final Map<String, dynamic> map = {
      'id': 'x',
      'name': 'push ups',
      'type': 'repeats',
      'value': 20,
      'itemType': 'exercise',
    };

    expect(entity.toMap(), map);
    expect(ExerciseEntity.fromMap(map), entity);
  });

  test('Rest Timer entity: to map, from map', () {
    const RestTimerEntity entity = RestTimerEntity(
      id: 'x',
      duration: 40,
    );
    final Map<String, dynamic> map = {
      'id': 'x',
      'duration': 40,
      'itemType': 'restTimer',
    };

    expect(entity.toMap(), map);
    expect(RestTimerEntity.fromMap(map), entity);
  });

  test('Workout Item Undefined entity: to map, from map', () {
    const WorkoutItemUndefinedEntity entity = WorkoutItemUndefinedEntity();
    const Map<String, dynamic>? map = null;

    expect(entity.toMap(), map);
    expect(const WorkoutItemUndefinedEntity(), entity);
  });

  test('Workout entity: to map, from map', () {
    const WorkoutEntity entity = WorkoutEntity(
      id: 'x',
      name: 'workoutName',
      items: [
        ExerciseEntity(
          id: 'x',
          name: 'push ups',
          type: ExerciseType.repeats,
          value: 20,
        ),
        RestTimerEntity(
          id: 'x',
          duration: 40,
        ),
      ],
    );
    final Map<String, dynamic> map = {
      'id': 'x',
      'name': 'workoutName',
      'items': [
        {
          'id': 'x',
          'name': 'push ups',
          'type': 'repeats',
          'value': 20,
          'itemType': 'exercise'
        },
        {'id': 'x', 'duration': 40, 'itemType': 'restTimer'},
      ]
    };

    // expect(entity.toMap(), map);
    expect(WorkoutEntity.fromMap(map), entity);
  });

  test('Workout entity filter: to map, from map', () {
    const WorkoutEntity entity = WorkoutEntity(
      id: 'x',
      name: 'workoutName',
      items: [
        ExerciseEntity(
          id: 'x',
          name: 'push ups',
          type: ExerciseType.repeats,
          value: 20,
        ),
        RestTimerEntity(
          id: 'x',
          duration: 40,
        ),
        WorkoutItemUndefinedEntity(),
      ],
    );

    const WorkoutEntity filteredEntity = WorkoutEntity(
      id: 'x',
      name: 'workoutName',
      items: [
        ExerciseEntity(
          id: 'x',
          name: 'push ups',
          type: ExerciseType.repeats,
          value: 20,
        ),
        RestTimerEntity(
          id: 'x',
          duration: 40,
        ),
      ],
    );

    final Map<String, dynamic> map = {
      'id': 'x',
      'name': 'workoutName',
      'items': [
        {
          'id': 'x',
          'name': 'push ups',
          'type': 'repeats',
          'value': 20,
          'itemType': 'exercise'
        },
        {'id': 'x', 'duration': 40, 'itemType': 'restTimer'},
        {'duration': 440, 'itemType': 'restTdsdaimer'},
      ]
    };
    final Map<String, dynamic> filteredMap = {
      'id': 'x',
      'name': 'workoutName',
      'items': [
        {
          'id': 'x',
          'name': 'push ups',
          'type': 'repeats',
          'value': 20,
          'itemType': 'exercise'
        },
        {'id': 'x', 'duration': 40, 'itemType': 'restTimer'},
      ]
    };

    expect(entity.toMap(), filteredMap);
    expect(WorkoutEntity.fromMap(map), filteredEntity);
  });
}
