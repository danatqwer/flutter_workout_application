import 'package:flutter_test/flutter_test.dart';
import 'package:workout_repository/src/entities/entities.dart';
import 'package:workout_repository/src/enums/enums.dart';
import 'package:workout_repository/src/models/models.dart';

void main() {
  test('Exercise model: to entity, from entity', () {
    const Exercise model = Exercise(
      id: 'x',
      name: 'push ups',
      type: ExerciseType.repeats,
      value: 20,
    );
    const ExerciseEntity entity = ExerciseEntity(
      id: 'x',
      name: 'push ups',
      type: ExerciseType.repeats,
      value: 20,
    );

    expect(model.toEntity(), entity);
    expect(Exercise.fromEntity(entity), model);
  });

  test('Rest Timer model: to entity, from entity', () {
    const RestTimerEntity entity = RestTimerEntity(
      id: 'x',
      duration: 40,
    );
    const RestTimer model = RestTimer(
      id: 'x',
      duration: 40,
    );

    expect(model.toEntity(), entity);
    expect(RestTimer.fromEntity(entity), model);
  });

  test('Workout model: to entity, from entity', () {
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
    const Workout model = Workout(
      id: 'x',
      name: 'workoutName',
      items: [
        Exercise(
          id: 'x',
          name: 'push ups',
          type: ExerciseType.repeats,
          value: 20,
        ),
        RestTimer(
          id: 'x',
          duration: 40,
        ),
      ],
    );

    expect(model.toEntity(), entity);
    expect(Workout.fromEntity(entity), model);
  });
}
