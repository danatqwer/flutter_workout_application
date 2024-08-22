import 'package:flutter_workout_application/src/features/workout/data/workout_data/source/remote/workout_remote_data_source.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_repository.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final WorkoutRemoteDataSource _remote;

  WorkoutRepositoryImpl({
    required WorkoutRemoteDataSource remote,
  }) : _remote = remote;

  @override
  Future<void> delete(String id) async {
    await _remote.delete(id);
  }

  @override
  Future<Workout> get(String id) async {
    return await _remote.get(id);
  }

  @override
  Future<List<Workout>> getList() async {
    return await _remote.getList();
  }

  @override
  Future<void> set(Workout workout) async {
    await _remote.set(workout);
  }

  @override
  Future<void> update(Workout workout) async {
    await _remote.update(workout);
  }
}
