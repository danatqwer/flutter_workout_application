import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_item_id_repository.dart';

class RemoveWorkoutItemIdUsecase {
  final WorkoutItemIdRepository workoutItemIdRepository;

  RemoveWorkoutItemIdUsecase({
    required this.workoutItemIdRepository,
  });

  Future<void> execute() async {
    await workoutItemIdRepository.remove();
  }
}
