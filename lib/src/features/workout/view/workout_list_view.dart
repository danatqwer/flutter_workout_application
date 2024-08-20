import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_bloc_state.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body: const SafeArea(
        child: _WorkoutsWrapWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(MainRoutes.workoutAddPath),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _WorkoutsWrapWidget extends StatelessWidget {
  const _WorkoutsWrapWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutListBloc, WorkoutListBlocState>(
      builder: (context, state) {
        return switch (state) {
          WorkoutListBlocLoadingState _ => const Center(
              child: Text('Loading...'),
            ),
          WorkoutListBlocFailureState _ => Center(
              child: Text(state.message),
            ),
          WorkoutListBlocSuccessState _ => _WorkoutListWidget(state),
          _ => const SizedBox(),
        };
      },
    );
  }
}

class _WorkoutListWidget extends StatelessWidget {
  const _WorkoutListWidget(this.state);

  final WorkoutListBlocSuccessState state;

  @override
  Widget build(BuildContext context) {
    final workouts = state.workouts;
    final itemCount = workouts.length;

    if (workouts.isEmpty) {
      return const Center(
        child: Text('Workouts is empty'),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) => _WorkoutWidget(workouts[index]),
      itemCount: itemCount,
      shrinkWrap: true,
    );
  }
}

class _WorkoutWidget extends StatelessWidget {
  const _WorkoutWidget(this.workout);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final name = workout.name;
    final id = workout.id;

    return MaterialButton(
      onPressed: () => onPressed(context, id),
      child: SizedBox(
        height: 64,
        child: Card(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context, String id) {
    final bloc = context.read<WorkoutListBloc>();
    bloc.add(WorkoutListBlocWorkoutPressedEvent(workoutId: id));
    context.go(MainRoutes.workoutPath);
  }
}
