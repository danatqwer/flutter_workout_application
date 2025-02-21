import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_item_id_repository.dart';

class GetWorkoutItemUsecase {
  final WorkoutEditRepository workoutEditRepository;
  final WorkoutItemIdRepository workoutItemIdRepository;

  GetWorkoutItemUsecase({
    required this.workoutEditRepository,
    required this.workoutItemIdRepository,
  });

  Future<WorkoutItem> execute() async {
    final workoutEdit = await workoutEditRepository.get();
    final workoutItemId = await workoutItemIdRepository.get();
    final workoutItem =
        workoutEdit.items.firstWhere((e) => e.id == workoutItemId);
    return workoutItem;
  }
}
