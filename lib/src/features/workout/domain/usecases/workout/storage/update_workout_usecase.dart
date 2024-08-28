import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

class UpdateWorkoutUseCase {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdRepository;

  UpdateWorkoutUseCase({
    required this.workoutRepository,
    required this.workoutIdRepository,
  });

  Future<void> execute(Workout workout) async {
    await workoutRepository.update(workout);
  }
}
