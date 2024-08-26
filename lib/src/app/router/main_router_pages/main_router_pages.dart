import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/source/remote/workout_remote_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/workout_repository.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/source/local/workout_id_local_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/workout_id_repository_impl.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_list_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/set_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/remove_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/set_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/view/workout_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/view/workout_list_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/view/workout_view.dart';
import 'package:go_router/go_router.dart';

abstract class MainRouterPages {
  /// Workout
  // Dependencies
  static final _workoutRepository = WorkoutRepositoryImpl(
    remote: WorkoutRemoteDataSourceImpl(FirebaseFirestore.instance),
  );
  static final _workoutIdRepository = WorkoutIdRepositoryImpl(
    local: WorkoutIdLocalDataSourceImpl(),
  );

  //GoRoutes
  static GoRoute workoutListGoRoute() {
    return GoRoute(
      path: MainRoutes.workoutListPath,
      name: MainRoutes.workoutListName,
      builder: (context, state) => BlocProvider(
        create: (context) => WorkoutListBloc(
          getWorkoutListUseCase: GetWorkoutListUsecase(
            workoutRepository: _workoutRepository,
          ),
          setWorkoutIdUseCase: SetWorkoutIdUsecase(
            workoutIdRepository: _workoutIdRepository,
          ),
          removeWorkoutIdUseCase: RemoveWorkoutIdUsecase(
            workoutIdRepository: _workoutIdRepository,
          ),
        ),
        child: const WorkoutListView(),
      ),
    );
  }

  static GoRoute workoutAddGoRoute() {
    return GoRoute(
      path: MainRoutes.workoutAddPath,
      name: MainRoutes.workoutAddName,
      builder: (context, state) => BlocProvider(
        create: (context) => WorkoutAddBloc(
          setWorkoutUseCase: SetWorkoutUseCase(
            workoutRepository: _workoutRepository,
          ),
        ),
        child: const WorkoutAddView(),
      ),
    );
  }

  static GoRoute workoutPageGoRoute() {
    return GoRoute(
      path: MainRoutes.workoutPath,
      name: MainRoutes.workoutName,
      builder: (context, state) => BlocProvider(
        create: (context) => WorkoutBloc(
          getWorkoutUseCase: GetWorkoutUseCase(
            workoutRepository: _workoutRepository,
            workoutIdRepository: _workoutIdRepository,
          ),
        ),
        child: const WorkoutView(),
      ),
    );
  }
}
