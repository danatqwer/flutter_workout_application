import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_item_id_repository.dart';

class SetWorkoutItemIdUsecase {
  final WorkoutItemIdRepository workoutItemIdRepository;

  SetWorkoutItemIdUsecase({
    required this.workoutItemIdRepository,
  });

  Future<void> execute(String id) async {
    await workoutItemIdRepository.set(id);
  }
}
