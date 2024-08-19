import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutIdSharedPreferencesRepsitory extends WorkoutIdRepository {
  final _key = 'workout_id';

  @override
  Future<void> set(String id) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_key, id);
  }

  @override
  Future<String> get() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final id = sharedPreferences.getString(_key);

    if (id == null) {
      throw ArgumentError.notNull('Workout id');
    }

    return id;
  }

  @override
  Future<void> remove() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_key);
  }
}
