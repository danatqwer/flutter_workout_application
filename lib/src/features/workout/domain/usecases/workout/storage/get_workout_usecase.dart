import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

class GetWorkoutUseCase {
  final WorkoutRepository workoutRepository;
  final WorkoutIdRepository workoutIdRepository;

  GetWorkoutUseCase({
    required this.workoutRepository,
    required this.workoutIdRepository,
  });

  Future<Workout> execute() async {
    final id = await workoutIdRepository.get();
    final workout = await workoutRepository.get(id);
    return workout;
  }
}
