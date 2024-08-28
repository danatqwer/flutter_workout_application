import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/empty_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/bloc/workout_list_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/bloc/workout_list_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_list_page/bloc/workout_list_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/error_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/loading_text.dart';
import 'package:go_router/go_router.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
      floatingActionButton: _FloatingActionButton(),
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
      title: const Text('Workouts'),
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
      child: _WorkoutListWidget(),
    );
  }
}

class _WorkoutListWidget extends StatelessWidget {
  const _WorkoutListWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutListBloc, WorkoutListBlocState>(
      builder: (context, state) {
        if (state.loading) {
          return const LoadingText();
        }
        if (state.errorMessage != null) {
          return FailureText(state.errorMessage ?? '');
        }
        if (state.workouts.isEmpty) {
          return const IsEmptyText('Workouts');
        }

        final workouts = state.workouts;
        final itemCount = workouts.length;

        return ListView.builder(
          itemBuilder: (context, index) => _WorkoutWidget(
            workout: workouts[index],
          ),
          itemCount: itemCount,
          shrinkWrap: true,
        );
      },
    );
  }
}

class _WorkoutWidget extends StatelessWidget {
  const _WorkoutWidget({required this.workout});

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    final name = workout.name;
    final id = workout.id;

    return GestureDetector(
      onTap: () => onPressed(context, id),
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

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.go(MainRoutes.workoutAddPath),
      child: const Icon(Icons.add),
    );
  }
}
