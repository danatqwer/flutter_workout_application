import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

abstract class WorkoutRemoteDataSource {
  Future<void> set(Workout workout);

  Future<Workout> get(String id);

  Future<void> update(Workout workout);

  Future<void> delete(String id);

  Future<List<Workout>> getList();
}