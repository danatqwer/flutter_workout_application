import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_workout_application/src/features/workout/data/entity/workout_entity.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/workout.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/delete_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/get_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/domain/usecases/workout/storage/set_workout_usecase.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutEditBloc extends Bloc<WorkoutEditBlocEvent, WorkoutEditBlocState> {
  final GetWorkoutUseCase getWorkoutUseCase;
  final SetWorkoutUseCase setWorkoutUseCase;
  final DeleteWorkoutUseCase deleteWorkoutUseCase;

  WorkoutEditBloc({
    required this.getWorkoutUseCase,
    required this.setWorkoutUseCase,
    required this.deleteWorkoutUseCase,
  }) : super(const WorkoutEditBlocInitializeState()) {
    on<WorkoutEditBlocEvent>(
      (event, emit) async {
        if (event is WorkoutEditBlocInitializeEvent) {
          await _onInitializeEvent(emit);
        } else if (event is WorkoutEditBlocUpdateEvent) {
          await _onUpdateEvent(event, emit);
        } else if (event is WorkoutEditBlocSaveEvent) {
          await _onSaveEvent(event, emit);
        } else if (event is WorkoutEditBlocDeleteEvent) {
          await _onDeleteEvent(event, emit);
        }
      },
      transformer: sequential(),
    );
    add(WorkoutEditBlocInitializeEvent());
  }

  Future<void> _onInitializeEvent(Emitter<WorkoutEditBlocState> emit) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final workoutString = sharedPreferences.getString('workout_edit');

      Workout workout;
      if (workoutString == null) {
        workout = await getWorkoutUseCase.execute();
        final toWorkoutString = jsonEncode(workout.toEntity().toMap());
        await sharedPreferences.setString('workout_edit', toWorkoutString);
      } else {
        try {
          final workoutMap = jsonDecode(workoutString) as Map<String, dynamic>;
          final workoutEntity = WorkoutEntity.fromMap(workoutMap);
          workout = Workout.fromEntity(workoutEntity);
        } catch (e) {
          final sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.remove('workout_edit');
          workout = await getWorkoutUseCase.execute();
        }
      }

      emit(WorkoutEditBlocInitializeState(
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      emit(WorkoutEditBlocInitializeState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateEvent(
    WorkoutEditBlocUpdateEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      final workout = event.workout;

      emit(WorkoutEditBlocInitializeState(
        loading: false,
        workout: workout,
      ));
    } catch (e) {
      emit(WorkoutEditBlocInitializeState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSaveEvent(
    WorkoutEditBlocSaveEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      final workout = event.workout;
      await setWorkoutUseCase.execute(workout);

      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove('workout_edit');

      emit(const WorkoutEditBlocSaveState(
        loading: false,
        successMessage: 'Workout updated successfully.',
      ));
    } catch (e) {
      emit(WorkoutEditBlocSaveState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteEvent(
    WorkoutEditBlocDeleteEvent event,
    Emitter<WorkoutEditBlocState> emit,
  ) async {
    try {
      await deleteWorkoutUseCase.execute();

      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove('workout_edit');

      emit(const WorkoutEditBlocDeleteState(
        loading: false,
        successMessage: 'Workout deleted successfully.',
      ));
    } catch (e) {
      emit(WorkoutEditBlocDeleteState(
        loading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
