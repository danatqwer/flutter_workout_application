import 'package:flutter_workout_application/src/features/workout/data/workout_edit_data/source/local/workout_edit_local_data_source.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/workout.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_edit_repository.dart';

class WorkoutEditRepositoryImpl implements WorkoutEditRepository {
  final WorkoutEditLocalDataSource _local;

  WorkoutEditRepositoryImpl({
    required WorkoutEditLocalDataSource local,
  }) : _local = local;

  @override
  Future<void> clean() async {
    await _local.clean();
  }

  @override
  Future<Workout?> get() async {
    return await _local.get();
  }

  @override
  Future<void> set(Workout workout) async {
    await _local.set(workout);
  }
}
