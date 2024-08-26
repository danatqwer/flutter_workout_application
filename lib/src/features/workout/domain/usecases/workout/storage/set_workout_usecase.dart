import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

class SetWorkoutUseCase {
  final WorkoutRepository workoutRepository;

  SetWorkoutUseCase({
    required this.workoutRepository,
  });

  Future<void> execute(Workout workout) async {
    return await workoutRepository.set(workout);
  }
}
