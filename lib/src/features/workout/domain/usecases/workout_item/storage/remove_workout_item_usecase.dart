import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_item_id_repository.dart';

class RemoveWorkoutItemUsecase {
  final WorkoutEditRepository workoutEditRepository;
  final WorkoutItemIdRepository workoutItemIdRepository;

  RemoveWorkoutItemUsecase({
    required this.workoutEditRepository,
    required this.workoutItemIdRepository,
  });

  Future<void> execute() async {
    final workoutEdit = await workoutEditRepository.get();
    final workoutItemId = await workoutItemIdRepository.get();

    workoutEdit.items.removeWhere((e) => e.id == workoutItemId);
    workoutEditRepository.set(workoutEdit);
  }
}
