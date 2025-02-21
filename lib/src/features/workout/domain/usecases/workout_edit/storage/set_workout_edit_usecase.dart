import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';

class SetWorkoutEditUseCase {
  final WorkoutEditRepository workoutEditRepository;

  SetWorkoutEditUseCase({
    required this.workoutEditRepository,
  });

  Future<void> execute(Workout workout) async {
    return await workoutEditRepository.set(workout);
  }
}
