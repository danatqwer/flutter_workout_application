import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';

class RemoveWorkoutIdUsecase {
  final WorkoutIdRepository workoutIdRepository;

  RemoveWorkoutIdUsecase({
    required this.workoutIdRepository,
  });

  Future<void> execute() async {
    await workoutIdRepository.remove();
  }
}
