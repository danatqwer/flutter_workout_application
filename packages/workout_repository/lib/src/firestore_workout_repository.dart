// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      await collection.doc().set(map);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Workout> get(String id) async {
    try {
      final document = await collection.doc(id).get();
      final data = document.data() as Map<String, dynamic>;
      data['id'] = document.id;
      final entity = WorkoutEntity.fromMap(data);
      final result = Workout.fromEntity(entity);
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await collection.doc(id).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Workout>> getList({bool docId = true}) async {
    Workout toWorkout(QueryDocumentSnapshot<Object?> e) {
      final map = e.data() as Map<String, dynamic>;
      if (docId) map['id'] = e.id;
      return Workout.fromEntity(WorkoutEntity.fromMap(map));
    }

    try {
      final querySnapshot = await collection.get();
      final documents = querySnapshot.docs;
      final result = documents.map(toWorkout).toList();
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
