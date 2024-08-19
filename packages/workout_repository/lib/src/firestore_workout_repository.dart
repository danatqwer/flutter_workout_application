import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:workout_repository/src/entities/entities.dart';
import 'package:workout_repository/src/models/workout.dart';

import 'workout_repository.dart';

class FirestoreWorkoutRepository implements WorkoutRepository {
  final FirebaseFirestore firestore;

  FirestoreWorkoutRepository(this.firestore);

  CollectionReference get collection => firestore.collection('workouts');

  @override
  Future<void> set(Workout workout) async {
    try {
      final map = workout.toEntity().toMap();
      final document = collection.doc(workout.id);
      await document
          .set(map)
          .onError((Exception error, stackTrace) => throw error);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Workout> get(String id) async {
    try {
      final document = await collection.doc(id).get();
      if (!document.exists) {
        throw ArgumentError.notNull('Document');
      }

      final data = document.data();
      if (data == null) {
        throw ArgumentError.notNull('Data');
      }

      final dataMap = data as Map<String, dynamic>;
      final entity = WorkoutEntity.fromMap(dataMap);
      final result = Workout.fromEntity(entity);
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> update(Workout workout) async {
    try {
      final map = workout.toEntity().toMap();
      final document = collection.doc(workout.id);
      await document
          .update(map)
          .onError((Exception error, stackTrace) => throw error);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final document = collection.doc(id);
      await document
          .delete()
          .onError((Exception error, stackTrace) => throw error);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Workout>> getList() async {
    try {
      final querySnapshot = await collection
          .get()
          .onError((Exception error, stackTrace) => throw error);
      final documents = querySnapshot.docs;
      final result = documents.map((e) {
        final map = e.data() as Map<String, dynamic>;
        return Workout.fromEntity(WorkoutEntity.fromMap(map));
      }).toList();
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
