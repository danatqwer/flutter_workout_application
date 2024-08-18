import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_workout_application/src/app/router/utils/constants/main_route_names.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workouts_bloc/workouts_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workouts_bloc/workouts_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workouts_bloc/workouts_state.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

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
        onPressed: () => context.go(MainRouteNames.workoutAdd),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _WorkoutsWrapWidget extends StatelessWidget {
  const _WorkoutsWrapWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
      builder: (context, state) {
        const initialWidget = SizedBox();

        const loadingText = Text('Loading...');
        const loadingWidget = Center(child: loadingText);

        final failureState = state as WorkoutsFailureState;
        final failureText = Text(failureState.message);
        final failureWidget = Center(child: failureText);

        final successState = state as WorkoutsSuccessState;
        final successWidget = _WorkoutsWidget(successState);

        return switch (state.status) {
          WorkoutsStateStatus.initial => initialWidget,
          WorkoutsStateStatus.loading => loadingWidget,
          WorkoutsStateStatus.failure => failureWidget,
          WorkoutsStateStatus.success => successWidget,
        };
      },

      // switch (state.status) {
      //   case WorkoutsStateStatus.initial:
      //     const initialWidget = SizedBox();
      //     return initialWidget;
      //   case WorkoutsStateStatus.loading:
      //     const loadingText = Text('Loading...');
      //     const loadingWidget = Center(child: loadingText);
      //     return loadingWidget;
      //   case WorkoutsStateStatus.failure:
      //     final failureState = state as WorkoutsFailureState;
      //     final failureText = Text(failureState.message);
      //     final failureWidget = Center(child: failureText);
      //     return failureWidget;
      //   case WorkoutsStateStatus.success:
      //     final successState = state as WorkoutsSuccessState;
      //     final successWidget = _WorkoutsWidget(successState);
      //     return successWidget;
      // }
    );
  }
}

class _WorkoutsWidget extends StatelessWidget {
  const _WorkoutsWidget(this.state);

  final WorkoutsSuccessState state;

  @override
  Widget build(BuildContext context) {
    final workouts = state.workouts;
    final itemCount = workouts.length;

    return ListView.builder(
      itemBuilder: (_, i) => _WorkoutWidget(workouts[i]),
      itemCount: itemCount,
    );
  }
}

class _WorkoutWidget extends StatelessWidget {
  const _WorkoutWidget(this.workout);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutsBloc>();
    final name = workout.name;
    final id = workout.id;

    final onTapEvent = bloc.add(WorkoutsWorkoutPressedEvent(
      context: context,
      workoutId: id,
    ));

    return ListTile(
      title: Text(name),
      onTap: () => onTapEvent,
      onLongPress: () {}, // Actions dialogue: delete, update func.
    );
  }
}
