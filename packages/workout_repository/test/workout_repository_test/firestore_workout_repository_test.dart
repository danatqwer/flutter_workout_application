import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'package:workout_repository/workout_repository.dart';

Future<void> main() async {
  test('Get workout list from firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    final actual = await helper.repository.getList();
    final matcher = mockWorkoutList;

    expect(actual, matcher);
  });

  test('Get workout in firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    final workoutList = await helper.repository.getList();
    final workout = workoutList[0];
    final id = workout.id;

    final actual = await helper.repository.get(id);
    final matcher = mockWorkoutList.firstWhere((e) => e.id == id);

    expect(actual, matcher);
  });

  test('Set workout in firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    final workout = helper.mockWorkout;
    await helper.repository.set(workout);
    mockWorkoutList.add(workout);

    final workoutList = await helper.repository.getList();

    final actual = workoutList;
    final matcher = mockWorkoutList;

    expect(actual, matcher);
  });

  test('Update workout in firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    final workout = mockWorkoutList[0];
    final newWorkout = Workout(
      id: workout.id,
      name: 'newname',
      items: workout.items,
    );
    
    await helper.repository.update(newWorkout);
    mockWorkoutList[0] = newWorkout;

    final updatedWorkoutListActual = await helper.repository.getList();
    final updatedWorkoutListMatcher = mockWorkoutList;

    final actual = updatedWorkoutListActual;
    final matcher = updatedWorkoutListMatcher;

    expect(actual, matcher);
  });

  test('Delete workout in firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    final workoutList = await helper.repository.getList();
    final workout = workoutList[0];
    final id = workout.id;

    await helper.repository.delete(id);
    mockWorkoutList.removeWhere((e) => e.id == id);

    final actual = await helper.repository.getList();
    final matcher = mockWorkoutList;

    expect(actual, matcher);
  });
}

class _TestHelper {
  final firestore = FakeFirebaseFirestore();

  FirestoreWorkoutRepository get repository =>
      FirestoreWorkoutRepository(firestore);

  Exercise get mockExercise {
    return const Exercise(
      id: 'i',
      name: 'n',
      type: ExerciseType.repeats,
      value: 20,
    );
  }

  RestTimer get mockRestTimer {
    return const RestTimer(
      id: 'i',
      duration: 40,
    );
  }

  Workout get mockWorkout {
    const uuid = Uuid();
    final id = uuid.v7();
    return Workout(
      id: id,
      name: 'n',
      items: [mockExercise, mockRestTimer],
    );
  }

  List<Workout> get mockWorkoutList {
    return [mockWorkout, mockWorkout, mockWorkout];
  }

  Future<void> fillMockCollection(List<Workout> mockWorkoutList) async {
    final collection = firestore.collection(repository.collection.path);
    for (var workout in mockWorkoutList) {
      collection.doc(workout.id).set(workout.toEntity().toMap());
    }
  }
}
