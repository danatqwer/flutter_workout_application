abstract class WorkoutItemIdRepository {
  Future<void> set(String id);

  Future<String> get();

  Future<void> remove();
}
