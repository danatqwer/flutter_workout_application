import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

class DeleteWorkoutUseCase {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdRepository;

  DeleteWorkoutUseCase({
    required this.workoutRepository,
    required this.workoutIdRepository,
  });

  Future<void> execute() async {
    final id = await workoutIdRepository.get();
    final workout = await workoutRepository.get(id);
    await workoutRepository.delete(workout.id);
  }
}
