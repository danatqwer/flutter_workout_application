import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_item_id_repository.dart';

class SetWorkoutItemUsecase {
  final WorkoutEditRepository workoutEditRepository;
  final WorkoutItemIdRepository workoutItemIdRepository;

  SetWorkoutItemUsecase({
    required this.workoutEditRepository,
    required this.workoutItemIdRepository,
  });

  Future<void> execute(WorkoutItem workoutItem) async {
    final workoutEdit = await workoutEditRepository.get();
    final workoutItemId = await workoutItemIdRepository.get();
    final workoutItemIndex =
        workoutEdit.items.indexWhere((e) => e.id == workoutItemId);

    if (workoutItemIndex == -1) {
      workoutEdit.items.add(workoutItem);
    } else {
      workoutEdit.items.removeAt(workoutItemIndex);
      workoutEdit.items.insert(workoutItemIndex, workoutItem);
    }

    workoutEditRepository.set(workoutEdit);
  }
}
