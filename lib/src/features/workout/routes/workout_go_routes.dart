import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/utils/constants/main_route_names.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_add_bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workouts_bloc/workouts_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workouts_bloc/workouts_event.dart';
import 'package:flutter_workout_application/src/features/workout/service/workout_service/shared_preferences_workout_id_service.dart';
import 'package:flutter_workout_application/src/features/workout/service/workout_service/workout_id_service.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workout_view.dart';
import 'package:flutter_workout_application/src/features/workout/view/workouts_view.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

import '../bloc/workout_bloc/workout_event.dart';

class WorkoutGoRoutes {
  static final firestore = FirebaseFirestore.instance;

  static final WorkoutRepository workoutRepository =
      FirestoreWorkoutRepository(firestore);
  static final WorkoutIdRepository workoutIdService =
      SharedPreferencesWorkoutIdService();

  static final workouts = GoRoute(
    path: MainRouteNames.workouts,
    builder: (context, state) => BlocProvider(
      create: (context) => WorkoutsBloc(
        workoutRepository: workoutRepository,
        workoutIdService: workoutIdService,
      )..add(WorkoutsInitializeEvent()),
      child: const WorkoutsView(),
    ),
  );

  static final workoutAdd = GoRoute(
    path: MainRouteNames.workoutAdd,
    builder: (context, state) => BlocProvider(
      create: (context) => WorkoutAddBloc(workoutRepository),
      child: const WorkoutAddView(),
    ),
  );

  static final workout = GoRoute(
    path: MainRouteNames.workout,
    builder: (context, state) => BlocProvider(
      create: (context) => WorkoutBloc(
        workoutRepository: workoutRepository,
        workoutIdService: workoutIdService,
      )..add(WorkoutInitializeEvent()),
      child: const WorkoutView(),
    ),
  );
}
