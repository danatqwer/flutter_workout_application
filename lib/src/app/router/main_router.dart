import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router_pages.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/app/router/view/exception_view.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/source/remote/workout_remote_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/workout_repository.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/source/local/workout_id_local_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/workout_id_repository_impl.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/bloc/workout_item_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/view/workout_item_add_view.dart';
import 'package:go_router/go_router.dart';



class MainRouter {
  // Dependencies
  static final workoutRepository = WorkoutRepositoryImpl(
    remote: WorkoutRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  static final workoutIdRepository = WorkoutIdRepositoryImpl(
    local: WorkoutIdLocalDataSourceImpl(),
  );

  // Router
  static final _router = GoRouter(
    routes: [
      MainRouterPages.workoutListGoRoute(),
      MainRouterPages.workoutPageGoRoute(),
      MainRouterPages.workoutAddGoRoute(),
     MainRouterPages.workoutEditPageGoRoute(),
      GoRoute(
        path: MainRoutes.workoutItemAddPath,
        name: MainRoutes.workoutItemAddName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutItemAddBloc(
            workoutRepository: workoutRepository,
            workoutIdRepository: workoutIdRepository,
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
