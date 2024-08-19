import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_list_bloc/workout_list_state.dart';
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
    return BlocBuilder<WorkoutListBloc, WorkoutListState>(
      builder: (context, state) {
        return switch (state) {
          WorkoutListLoadingState _ => const Center(
              child: Text('Loading...'),
            ),
          WorkoutListFailureState _ => Center(
              child: Text(state.message),
            ),
          WorkoutListSuccessState _ => _WorkoutListWidget(state),
          _ => const SizedBox(),
        };
      },
    );
  }
}

class _WorkoutListWidget extends StatelessWidget {
  const _WorkoutListWidget(this.state);

  final WorkoutListSuccessState state;

  @override
  Widget build(BuildContext context) {
    final workouts = state.workouts;
    final itemCount = workouts.length;

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

    if (id == null) {
      return const SizedBox();
    }

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
    bloc.add(WorkoutListWorkoutPressedEvent(workoutId: id));
    context.go(MainRoutes.workoutPath);
  }
}
