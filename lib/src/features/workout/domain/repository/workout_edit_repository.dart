import 'package:flutter_workout_application/src/features/workout/domain/model/workout.dart';

abstract class WorkoutEditRepository {
  Future<void> set(Workout workout);

  Future<Workout?> get();

  Future<void> clean();
}
