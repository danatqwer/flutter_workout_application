import 'package:flutter_workout_application/src/features/workout/data/workout_item_id_data/source/local/workout_item_id_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutItemIdLocalDataSourceImpl extends WorkoutItemIdLocalDataSource {
  final _key = 'workout_item_id';

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
      throw ArgumentError.notNull('Workout item id');
    }

    return id;
  }

  @override
  Future<void> remove() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_key);
  }
}
