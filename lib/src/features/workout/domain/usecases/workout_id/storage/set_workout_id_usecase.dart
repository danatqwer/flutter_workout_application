import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';

class SetWorkoutIdUsecase {
  final WorkoutIdRepository workoutIdRepository;

  SetWorkoutIdUsecase({
    required this.workoutIdRepository,
  });

  Future<void> execute(String id) async {
    await workoutIdRepository.set(id);
  }
}
