import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/source/local/workout_id_local_data_source.dart';
import 'package:flutter_workout_application/src/features/workout/domain/repository/workout_id_repository.dart';

class WorkoutIdRepositoryImpl extends WorkoutIdRepository {
  final WorkoutIdLocalDataSource _localStorage;

  WorkoutIdRepositoryImpl({
    required WorkoutIdLocalDataSource local,
  }) : _localStorage = local;

  @override
  Future<void> set(String id) async {
    return await _localStorage.set(id);
  }

  @override
  Future<String> get() async {
    return await _localStorage.get();
  }

  @override
  Future<void> remove() async {
    return await _localStorage.remove();
  }
}
