import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';

class CleanWorkoutEditUseCase {
  final WorkoutEditRepository workoutEditRepository;

  CleanWorkoutEditUseCase({
    required this.workoutEditRepository,
  });

  Future<void> execute() async {
    return await workoutEditRepository.clean();
  }
}
