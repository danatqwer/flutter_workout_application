import 'models/workout.dart';

abstract class WorkoutRepository {
  Future<void> set(Workout workout) async {
    throw UnimplementedError();
  }

  Future<Workout> get(String id) async {
    throw UnimplementedError();
  }

  Future<void> update(Workout workout) async {
    throw UnimplementedError();
  }

  Future<void> delete(String id) async {
    throw UnimplementedError();
  }

  Future<List<Workout>> getList() async {
    throw UnimplementedError();
  }
}
