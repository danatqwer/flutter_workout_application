import 'dart:convert';

import 'package:flutter_workout_application/src/features/workout/data/entity/workout_entity.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_edit_data/source/local/workout_edit_local_data_source.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutEditLocalDataSourceImpl implements WorkoutEditLocalDataSource {
  final _key = 'workout_edit';

  @override
  Future<void> set(Workout workout) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final toWorkoutString = jsonEncode(workout.toEntity().toMap());
    await sharedPreferences.setString(_key, toWorkoutString);
  }

  @override
  Future<Workout> get() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final workoutString = sharedPreferences.getString(_key);

    if (workoutString == null) {
      return throw ArgumentError.notNull('Workout string');
    }

    final workoutMap = jsonDecode(workoutString) as Map<String, dynamic>;
    final workoutEntity = WorkoutEntity.fromMap(workoutMap);
    final workout = Workout.fromEntity(workoutEntity);
    return workout;
  }

  @override
  Future<void> clean() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_key);
  }
}
