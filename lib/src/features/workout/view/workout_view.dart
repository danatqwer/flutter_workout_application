import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_bloc/workout_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/view/widgets/workout_item_widget/workout_item_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _AppBarTitle(),
        leading: BackButton(
          onPressed: () => context.go(MainRoutes.workoutListPath),
        ),
        actions: [
          IconButton(
            onPressed: () => context.go(MainRoutes.workoutEditPath),
            icon: const Icon(Icons.edit),
          ),
        ],
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
    return BlocBuilder<WorkoutBloc, WorkoutBlocState>(
      builder: (context, state) => switch (state) {
        WorkoutBlocLoadingState _ => const Text('Loading...'),
        WorkoutBlocFailureState _ => Text(state.message),
        WorkoutBlocSuccessState _ => Text(state.workout.name),
        _ => const SizedBox(),
      },
    );
  }
}

class _WorkoutItemsWrapWidget extends StatelessWidget {
  const _WorkoutItemsWrapWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutBlocState>(
      builder: (context, state) => switch (state) {
        WorkoutBlocLoadingState _ => const Center(
            child: Text('Loading...'),
          ),
        WorkoutBlocFailureState _ => Center(
            child: Text(state.message),
          ),
        WorkoutBlocSuccessState _ => _WorkoutItemsWidget(state),
        _ => const SizedBox(),
      },
    );
  }
}

class _WorkoutItemsWidget extends StatelessWidget {
  const _WorkoutItemsWidget(this.state);

  final WorkoutBlocSuccessState state;

  @override
  Widget build(BuildContext context) {
    final workout = state.workout;
    final items = workout.items;
    int selectedIndex = state.selectedIndex;
    bool workoutStarted = state.workoutStarted;

    if (items.isEmpty) {
      return const Center(
        child: Text('Workouts items is empty'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => _WorkoutItemWrapWidget(
        item: items[index],
        index: index,
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
