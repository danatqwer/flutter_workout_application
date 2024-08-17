import 'package:go_router/go_router.dart';
import 'package:flutter_workout_application/app/router/utils/constants/main_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/features/workout/bloc/workout_add_bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/features/workout/bloc/workouts_bloc/workouts_bloc.dart';
import 'package:flutter_workout_application/features/workout/bloc/workouts_bloc/workouts_event.dart';
import 'package:flutter_workout_application/features/workout/view/workout_add_view.dart';
import 'package:flutter_workout_application/features/workout/view/workouts_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_repository/workout_repository.dart';

class MainRouter {
  static final _router = GoRouter(
    initialLocation: MainRoutes.workouts,
    routes: [
      GoRoute(
        path: MainRoutes.workouts,
        builder: (context, state) => BlocProvider(
          create: (context) {
            final firestore = FirebaseFirestore.instance;
            final workoutRepository = FirestoreWorkoutRepository(firestore);
            return WorkoutsBloc(workoutRepository)
              ..add(WorkoutsInitializeEvent());
          },
          child: const WorkoutsView(),
        ),
      ),
      GoRoute(
        path: MainRoutes.workoutAdd,
        builder: (context, state) => BlocProvider(
          create: (context) {
            final firestore = FirebaseFirestore.instance;
            final workoutRepository = FirestoreWorkoutRepository(firestore);
            return WorkoutAddBloc(workoutRepository);
          },
          child: const WorkoutAddView(),
        ),
      ),
    ],
  );

  static GoRouter get router => _router;
}
