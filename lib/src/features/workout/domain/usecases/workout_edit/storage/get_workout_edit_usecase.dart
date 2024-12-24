import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';

class GetWorkoutEditUseCase {
  final WorkoutEditRepository workoutEditRepository;

  GetWorkoutEditUseCase({
    required this.workoutEditRepository,
  });

  Future<Workout?> execute() async {
    final workout = await workoutEditRepository.get();
    return workout;
  }
}
