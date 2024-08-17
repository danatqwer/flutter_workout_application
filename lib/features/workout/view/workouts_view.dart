import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/features/workout/bloc/workouts_bloc/workouts_bloc.dart';
import 'package:flutter_workout_application/features/workout/bloc/workouts_bloc/workouts_state.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout'),
      ),
      body: const SafeArea(
        child: _WorkoutReorderableListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

class _WorkoutReorderableListView extends StatelessWidget {
  const _WorkoutReorderableListView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
      builder: (context, state) {
        switch (state.status) {
          case WorkoutsStateStatus.initial:
            return const Center(
              child: Text("An error has occured..."),
            );

          case WorkoutsStateStatus.loading:
            return const Center(
              child: Text('Loading...'),
            );

          case WorkoutsStateStatus.failure:
            state = state as WorkoutsFailureState;
            return Center(
              child: Text(state.message),
            );

          case WorkoutsStateStatus.success:
            state = state as WorkoutsSuccessState;
            final workouts = state.workouts;
            final itemCount = workouts.length;
            return ReorderableListView.builder(
              itemBuilder: (context, index) {
                final workout = workouts[index];
                return ListTile(
                  title: Text(workout.name),
                  onTap: () {}, // Go to workout screen
                  onLongPress: () {}, // Actions dialogue: delete, update func.
                );
              },
              itemCount: itemCount,
              onReorder: (oldIndex, newIndex) {},
            );
        }
      },
    );
  }
}
