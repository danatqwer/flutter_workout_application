import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/source/remote/workout_remote_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_data/workout_repository.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_edit_data/source/local/workout_edit_local_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_edit_data/workout_edit_repository_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/source/local/workout_id_local_data_source_impl.dart';
import 'package:flutter_workout_application/src/features/workout/data/workout_id_data/workout_id_repository_impl.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/delete_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_list_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/set_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/update_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/clean_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/get_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_edit/storage/set_workout_edit_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/remove_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout_id/storage/set_workout_id_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/view/workout_add_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/view/workout_edit_view.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/bloc/workout_item_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/view/workout_item_add_view.dart';
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
  static final _workoutEditRepository = WorkoutEditRepositoryImpl(
    local: WorkoutEditLocalDataSourceImpl(),
  );

  // Use cases
  static final _getWorkoutListUsecase = GetWorkoutListUsecase(
    workoutRepository: _workoutRepository,
  );
  static final _getWorkoutUseCase = GetWorkoutUseCase(
    workoutRepository: _workoutRepository,
    workoutIdRepository: _workoutIdRepository,
  );
  static final _setWorkoutUseCase = SetWorkoutUseCase(
    workoutRepository: _workoutRepository,
  );
  static final _updateWorkoutUseCase = UpdateWorkoutUseCase(
    workoutRepository: _workoutRepository,
    workoutIdRepository: _workoutIdRepository,
  );
  static final _deleteWorkoutUseCase = DeleteWorkoutUseCase(
    workoutRepository: _workoutRepository,
    workoutIdRepository: _workoutIdRepository,
  );
  static final _setWorkoutIdUsecase = SetWorkoutIdUsecase(
    workoutIdRepository: _workoutIdRepository,
  );
  static final _removeWorkoutIdUsecase = RemoveWorkoutIdUsecase(
    workoutIdRepository: _workoutIdRepository,
  );
  // Workout edit
  static final _getWorkoutEditUseCase = GetWorkoutEditUseCase(
    workoutEditRepository: _workoutEditRepository,
  );
  static final _setWorkoutEditUseCase = SetWorkoutEditUseCase(
    workoutEditRepository: _workoutEditRepository,
  );
  static final _cleanWorkoutEditUseCase = CleanWorkoutEditUseCase(
    workoutEditRepository: _workoutEditRepository,
  );

  // GoRoutes
  static GoRoute workoutListGoRoute() {
    return GoRoute(
      path: MainRoutes.workoutListPath,
      name: MainRoutes.workoutListName,
      builder: (context, state) => BlocProvider(
        create: (context) => WorkoutListBloc(
          getWorkoutListUseCase: _getWorkoutListUsecase,
          setWorkoutIdUseCase: _setWorkoutIdUsecase,
          removeWorkoutIdUseCase: _removeWorkoutIdUsecase,
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
          setWorkoutUseCase: _setWorkoutUseCase,
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
          getWorkoutUseCase: _getWorkoutUseCase,
        ),
        child: const WorkoutView(),
      ),
    );
  }

  static GoRoute workoutEditPageGoRoute() {
    return GoRoute(
      path: MainRoutes.workoutEditPath,
      name: MainRoutes.workoutEditName,
      builder: (context, state) => BlocProvider(
        create: (context) => WorkoutEditBloc(
          getWorkoutUseCase: _getWorkoutUseCase,
          setWorkoutUseCase: _setWorkoutUseCase,
          deleteWorkoutUseCase: _deleteWorkoutUseCase,
          getWorkoutEditUseCase: _getWorkoutEditUseCase,
          setWorkoutEditUseCase: _setWorkoutEditUseCase,
          cleanWorkoutEditUseCase: _cleanWorkoutEditUseCase,
        ),
        child: const WorkoutEditView(),
      ),
    );
  }

  static GoRoute workoutItemAddPageGoRoute() {
    return GoRoute(
      path: MainRoutes.workoutItemAddPath,
      name: MainRoutes.workoutItemAddName,
      builder: (context, state) => BlocProvider(
        create: (context) => WorkoutItemAddBloc(
          getWorkoutEditUseCase: _getWorkoutEditUseCase,
          setWorkoutEditUseCase: _setWorkoutEditUseCase,
        ),
        child: const WorkoutItemAddView(),
      ),
    );
  }
}
