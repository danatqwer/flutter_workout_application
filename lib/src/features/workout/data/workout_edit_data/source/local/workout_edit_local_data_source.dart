import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';

abstract class WorkoutEditLocalDataSource {
  Future<void> set(Workout workout);

  Future<Workout> get();

  Future<void> clean();
}
