import 'package:flutter_workout_application/src/features/workout/routes/workout_go_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_workout_application/src/app/router/utils/constants/main_route_names.dart';

class MainRouter {
  static final _router = GoRouter(
    initialLocation: MainRouteNames.workouts,
    routes: [
      WorkoutGoRoutes.workouts,
      WorkoutGoRoutes.workoutAdd,
    ],
  );

  static GoRouter get router => _router;
}
