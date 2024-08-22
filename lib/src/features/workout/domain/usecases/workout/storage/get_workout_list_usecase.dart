import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

class GetWorkoutListUsecase{
  final WorkoutRepository workoutRepository;

  GetWorkoutListUsecase({
    required this.workoutRepository,
  });

  Future<List<Workout>> execute() async {
    return await workoutRepository.getList();
  }
}
