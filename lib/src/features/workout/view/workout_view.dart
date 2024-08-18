import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_state.dart';
import 'package:flutter_workout_application/src/features/workout/view/widgets/workout_item_widget/workout_item_widget.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(),
      ),
      body: const SafeArea(
        child: _WorkoutItemsWrapWidget(),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      const initialWidget = SizedBox();

      const loadingWidget = Text('Loading...');

      final failureState = state as WorkoutFailureState;
      final failureMessage = failureState.message;
      final failureWidget = Text(failureMessage);

      final successState = state as WorkoutSuccessState;
      final successWorkoutName = successState.workout.name;
      final successWidget = Text(successWorkoutName);

      return switch (state.status) {
        WorkoutStateStatus.initial => initialWidget,
        WorkoutStateStatus.loading => loadingWidget,
        WorkoutStateStatus.failure => failureWidget,
        WorkoutStateStatus.success => successWidget,
      };
    });
  }
}

class _WorkoutItemsWrapWidget extends StatelessWidget {
  const _WorkoutItemsWrapWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        const initialWidget = SizedBox();

        const loadingText = Text('Loading...');
        const loadingWidget = Center(child: loadingText);

        final failureState = state as WorkoutFailureState;
        final failureText = Text(failureState.message);
        final failureWidget = Center(child: failureText);

        final successState = state as WorkoutSuccessState;
        final successWidget = _WorkoutItemsWidget(successState);

        return switch (state.status) {
          WorkoutStateStatus.initial => initialWidget,
          WorkoutStateStatus.loading => loadingWidget,
          WorkoutStateStatus.failure => failureWidget,
          WorkoutStateStatus.success => successWidget,
        };
      },
    );
  }
}

class _WorkoutItemsWidget extends StatelessWidget {
  const _WorkoutItemsWidget(this.state);

  final WorkoutSuccessState state;

  @override
  Widget build(BuildContext context) {
    final workout = state.workout;
    final items = workout.items;
    int selectedIndex = state.selectedIndex;
    bool workoutStarted = state.workoutStarted;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (_, i) => _WorkoutItemWrapWidget(
        item: items[i],
        index: i,
        selectedIndex: selectedIndex,
        workoutStarted: workoutStarted,
      ),
    );
  }
}

class _WorkoutItemWrapWidget extends StatelessWidget {
  const _WorkoutItemWrapWidget({
    required this.item,
    required this.index,
    required this.selectedIndex,
    required this.workoutStarted,
  });

  final WorkoutItem item;
  final int index;
  final int selectedIndex;
  final bool workoutStarted;

  @override
  Widget build(BuildContext context) {
    final selected = index == selectedIndex && workoutStarted;
    final enabled = index > selectedIndex;

    return WorkoutItemWidget(
      item: item,
      selected: selected,
      enabled: enabled,
    );
  }
}
