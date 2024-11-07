import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/empty_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/error_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/loading_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/bloc/workout_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/view/widgets/workout_item_widget/workout_item_widget.dart';
import 'package:go_router/go_router.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const _Title(),
      leading: BackButton(
        onPressed: () => context.go(MainRoutes.workoutListPath),
      ),
      actions: [
        TextButton(
          onPressed: () => context.go(MainRoutes.workoutEditPath),
          child: const Text('Edit'),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutBlocState>(
      builder: (context, state) {
        if (state.loading) {
          return const LoadingText();
        }
        if (state.errorMessage != null) {
          return FailureText(state.errorMessage ?? '');
        }

        final workoutName = state.workout.name;

        if (workoutName.isEmpty) {
          return const IsEmptyText('Workout name');
        }

        return Text(workoutName);
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      child: Column(
        children: [
          _WorkoutActions(),
          _WorkoutItemsWidget(),
        ],
      ),
    );
  }
}

class _WorkoutActions extends StatelessWidget {
  const _WorkoutActions();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutBloc>();

    return BlocBuilder<WorkoutBloc, WorkoutBlocState>(
      builder: (context, state) {
        return SizedBox(
          width: double.maxFinite,
          child: Card(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                TextButton(
                  onPressed: () => bloc.add(WorkoutBlocNextEvent()),
                  child: const Text('Next'),
                ),
                state.workoutPaused
                    ? TextButton(
                        onPressed: () => bloc.add(WorkoutBlocResumeEvent()),
                        child: const Text('Resume'),
                      )
                    : TextButton(
                        onPressed: () => bloc.add(WorkoutBlocPauseEvent()),
                        child: const Text('Pause'),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WorkoutItemsWidget extends StatelessWidget {
  const _WorkoutItemsWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutBlocState>(
      builder: (context, state) {
        if (state.loading) {
          return const LoadingText();
        }
        if (state.errorMessage != null) {
          return FailureText(state.errorMessage ?? '');
        }

        final bloc = context.read<WorkoutBloc>();
        final workout = state.workout;
        final items = workout.items;
        int selectedIndex = state.selectedIndex;
        bool workoutStarted = state.workoutStarted;
        bool workoutPaused = state.workoutPaused;

        if (items.isEmpty) {
          return const IsEmptyText('Workout items');
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final selected = index == selectedIndex && workoutStarted;
            final enabled = index >= selectedIndex;

            return WorkoutItemWidget(
              item: items[index],
              selected: selected,
              enabled: enabled,
              pause: workoutPaused,
              onTimerEnd: () => bloc.add(WorkoutBlocNextEvent()),
            );
          },
        );
      },
    );
  }
}
