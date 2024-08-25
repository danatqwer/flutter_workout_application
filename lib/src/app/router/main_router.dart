import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/view/exception_view.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/source/remote/workout_remote_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/workout_repository.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/source/local/workout_id_local_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/workout_id_repository_impl.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_list_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/remove_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/set_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/bloc/workout_item_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/view/workout_edit_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/view/workout_item_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/view/workout_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/view/workout_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/view/workout_list_view.dart';
import 'package:go_router/go_router.dart';

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
  static final workoutRepository = WorkoutRepositoryImpl(
    remote: WorkoutRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  static final workoutIdRepository = WorkoutIdRepositoryImpl(
    local: WorkoutIdLocalDataSourceImpl(),
  );

  // Router
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: MainRoutes.workoutListPath,
        name: MainRoutes.workoutListName,
        builder: (context, state) => BlocProvider(
          create: (context) => WorkoutListBloc(
            getWorkoutListUseCase: GetWorkoutListUsecase(
              workoutRepository: workoutRepository,
            ),
            setWorkoutIdUseCase: SetWorkoutIdUsecase(
              workoutIdRepository: workoutIdRepository,
            ),
            removeWorkoutIdUseCase: RemoveWorkoutIdUsecase(
              workoutIdRepository: workoutIdRepository,
            ),
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
            getWorkoutUseCase: GetWorkoutUseCase(
              workoutRepository: workoutRepository,
              workoutIdRepository: workoutIdRepository,
            ),
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
            workoutIdRepository: workoutIdRepository,
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
