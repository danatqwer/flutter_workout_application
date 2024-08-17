import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workout_repository/workout_repository.dart';

Future<void> main() async {
  test('Get workout list from firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    final actual = await helper.repository.getList(docId: false);
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
    if (id == null) {
      throw ArgumentError.notNull('Workout id');
    }

    final actual = await helper.repository.get(id);
    final matcher = workout;

    expect(actual, matcher);
  });

  test('Set workout in firestore', () async {
    final helper = _TestHelper();

    final mockWorkoutList = helper.mockWorkoutList;
    await helper.fillMockCollection(mockWorkoutList);

    await helper.repository.set(helper.mockWorkout);
    final workoutList = await helper.repository.getList(docId: false);

    mockWorkoutList.add(helper.mockWorkout);

    final actual = workoutList;
    final matcher = mockWorkoutList;

    expect(actual, matcher);
  });

  test('Delete workout in firestore', () async {
    final helper = _TestHelper();
    await helper.fillMockCollection(helper.mockWorkoutList);

    final workoutList = await helper.repository.getList();
    final workout = workoutList[0];
    final id = workout.id;
    if (id == null) {
      return isFalse;
    }

    workoutList.removeWhere((e) => e.id == id);

    await helper.repository.delete(id);

    final actual = await helper.repository.getList();
    final matcher = workoutList;

    expect(actual, matcher);
  });
}

class _TestHelper {
  final firestore = FakeFirebaseFirestore();

  FirestoreWorkoutRepository get repository =>
      FirestoreWorkoutRepository(firestore);

  CollectionReference get collection =>
      firestore.collection(repository.collection.path);

  Exercise get mockExercise {
    return const Exercise(
        id: 'i', name: 'n', type: ExerciseType.repeats, value: 20);
  }

  RestTimer get mockRestTimer {
    return const RestTimer(id: 'i', duration: 40);
  }

  Workout get mockWorkout {
    return Workout(id: 'i', name: 'n', items: [mockExercise, mockRestTimer]);
  }

  List<Workout> get mockWorkoutList {
    return [mockWorkout, mockWorkout, mockWorkout];
  }

  Future<void> fillMockCollection(List<Workout> mockWorkoutList) async {
    final collection = firestore.collection(repository.collection.path);
    for (var workout in mockWorkoutList) {
      await collection.add(workout.toEntity().toMap());
    }
  }
}
