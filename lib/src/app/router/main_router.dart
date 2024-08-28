import 'package:flutter_workout_application/src/app/router/main_router_pages.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/app/router/view/exception_view.dart';
import 'package:go_router/go_router.dart';

class MainRouter {
  static final _router = GoRouter(
    routes: [
      MainRouterPages.workoutListGoRoute(),
      MainRouterPages.workoutPageGoRoute(),
      MainRouterPages.workoutAddGoRoute(),
      MainRouterPages.workoutEditPageGoRoute(),
      MainRouterPages.workoutItemAddPageGoRoute()
    ],
    initialLocation: MainRoutes.workoutListPath,
    onException: (context, state, router) => const ExceptionView(),
  );

  static GoRouter get router => _router;
}
