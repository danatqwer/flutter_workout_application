import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/view/exception_view.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_add_bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_shared_preferences_repository.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/add_workout_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class MainRoutes {
  // Name
  static const workoutListName = 'workout_list';
  static const workoutName = 'workout';
  static const workoutAddName = 'workout_add';

  // Path
  static const workoutListPath = '/$workoutListName';
  static const workoutPath = '/$workoutListName/$workoutName';
  static const workoutAddPath = '/$workoutListName/$workoutAddName';
}

class MainRouter {
  // Routes
  static const routes = MainRoutes;

  // Dependencies
  static final firestore = FirebaseFirestore.instance;
  static final WorkoutRepository workoutRepository =
      FirestoreWorkoutRepository(firestore);
  static final WorkoutIdRepository workoutIdService =
      WorkoutIdSharedPreferencesRepsitory();

  // Router
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: MainRoutes.workoutListPath,
        name: MainRoutes.workoutListName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutListBloc(
            workoutRepository: workoutRepository,
            workoutIdService: workoutIdService,
          ),
          child: const WorkoutListView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutAddPath,
        name: MainRoutes.workoutAddName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutAddBloc(workoutRepository),
          child: const AddWorkoutView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutPath,
        name: MainRoutes.workoutName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutBloc(
            workoutRepository: workoutRepository,
            workoutIdService: workoutIdService,
          ),
          child: const WorkoutView(),
        ),
      ),
    ],
    initialLocation: MainRoutes.workoutListPath,
    onException: (context, state, router) => const ExceptionView(),
  );

  static GoRouter get router => _router;
}
