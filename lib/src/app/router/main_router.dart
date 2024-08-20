import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/view/exception_view.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_add_bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_edit_bloc/workout_edit_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_item_add_bloc/workout_item_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_shared_preferences_repository.dart';
import 'package:flutter_workout_application/src/features/workout/repository/workout_id_repsitory/workout_id_repository.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_edit_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_item_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class MainRoutes {
  // Name
  static const workoutListName = 'workout_list';
  static const workoutName = 'workout';
  static const workoutAddName = 'workout_add';
  static const workoutEditName = 'workout_edit';
  static const workoutItemAddName = 'workout_item_add';

  // Path
  static const workoutListPath = '/$workoutListName';
  static const workoutPath = '/$workoutListName/$workoutName';
  static const workoutAddPath = '/$workoutListName/$workoutAddName';
  static const workoutEditPath =
      '/$workoutListName/$workoutName/$workoutEditName';
  static const workoutItemAddPath =
      '/$workoutListName/$workoutName/$workoutEditName/$workoutItemAddName';
}

class MainRouter {
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
            workoutIdRepository: workoutIdService,
          ),
          child: const WorkoutListView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutAddPath,
        name: MainRoutes.workoutAddName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutAddBloc(workoutRepository),
          child: const WorkoutAddView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutPath,
        name: MainRoutes.workoutName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutBloc(
            workoutRepository: workoutRepository,
            workoutIdRepository: workoutIdService,
          ),
          child: const WorkoutView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutEditPath,
        name: MainRoutes.workoutEditName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutEditBloc(
            workoutRepository: workoutRepository,
            workoutIdRepository: workoutIdService,
          ),
          child: const WorkoutEditView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutItemAddPath,
        name: MainRoutes.workoutItemAddName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutItemAddBloc(
            workoutRepository: workoutRepository,
            workoutIdRepository: workoutIdService,
          ),
          child: const WorkoutItemAddView(),
        ),
      ),
    ],
    initialLocation: MainRoutes.workoutListPath,
    onException: (context, state, router) => const ExceptionView(),
  );

  static GoRouter get router => _router;
}
