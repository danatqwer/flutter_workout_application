import 'package:flutter_workout_application/src/features/workout/service/workout_service/workout_id_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWorkoutIdService extends WorkoutIdRepository {
  final _key = 'workout_id';

  @override
  Future<void> set(String id) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_key, id);
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
}
