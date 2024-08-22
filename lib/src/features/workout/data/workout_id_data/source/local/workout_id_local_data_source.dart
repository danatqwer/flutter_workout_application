abstract class WorkoutIdLocalDataSource {
  Future<void> set(String id);

  Future<String> get();

  Future<void> remove();
}
