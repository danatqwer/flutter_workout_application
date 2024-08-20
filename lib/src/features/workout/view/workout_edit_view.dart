import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_edit_bloc/workout_edit_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_edit_bloc/workout_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/bloc/workout_edit_bloc/workout_edit_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/view/widgets/workout_item_widget/workout_item_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutEditView extends StatelessWidget {
  const WorkoutEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: SafeArea(
        child: _WorkoutItemsWrapWidget(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const _AppBarTitle(),
      leading: BackButton(
        onPressed: () => context.go(MainRoutes.workoutPath),
      ),
      actions: [
        _SaveButton(),
        const SizedBox(width: 8.0),
      ],
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutEditBloc, WorkoutEditBlocState>(
      buildWhen: (previous, current) =>
          current is WorkoutEditBlocInitializeState,
      builder: (context, state) => switch (state) {
        WorkoutEditBlocLoadingState _ => const Text('Loading...'),
        WorkoutEditBlocFailureState _ => Text(state.message),
        WorkoutEditBlocSuccessState _ => Text(state.workout.name),
        _ => const SizedBox(),
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutEditBloc, WorkoutEditBlocState>(
      listenWhen: (previous, current) => current is WorkoutEditBlocSaveState,
      listener: (context, state) {
        final message = switch (state) {
          WorkoutEditBlocSaveLoadingState _ => 'Saving...',
          WorkoutEditBlocSaveFailureState _ =>
            'Saving failed: ${state.message}',
          WorkoutEditBlocSaveSuccessState _ => 'Saved',
          _ => null,
        };
        if (message != null) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      },
      child: TextButton(
        onPressed: () {
          final bloc = context.read<WorkoutEditBloc>();
          final blocState = bloc.state;
          if (blocState is WorkoutEditBlocSuccessState) {
            bloc.add(WorkoutEditBlocSaveEvent(blocState.workout));
            context.go(MainRoutes.workoutPath);
          }
        },
        child: const Text('Save'),
      ),
    );
  }

  void onPressed(BuildContext context) {}
}

class _WorkoutItemsWrapWidget extends StatelessWidget {
  const _WorkoutItemsWrapWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutEditBloc, WorkoutEditBlocState>(
      builder: (context, state) => switch (state) {
        WorkoutEditBlocLoadingState _ => const Center(
            child: Text('Loading...'),
          ),
        WorkoutEditBlocFailureState _ => Center(
            child: Text(state.message),
          ),
        WorkoutEditBlocSuccessState _ => _WorkoutItemsWidget(state),
        _ => const SizedBox(),
      },
    );
  }
}

class _WorkoutItemsWidget extends StatelessWidget {
  const _WorkoutItemsWidget(this.state);

  final WorkoutEditBlocSuccessState state;

  @override
  Widget build(BuildContext context) {
    final workout = state.workout;
    final items = workout.items;

    return ReorderableListView.builder(
      itemBuilder: (context, index) => WorkoutItemWidget(
        key: ValueKey(index),
        item: items[index],
      ),
      itemCount: items.length,
      onReorder: (a, b) => _onReorder(a, b, items),
      footer: const _WorkoutItemAddButton(),
      shrinkWrap: true,
    );
  }

  void _onReorder(int oldIndex, int newIndex, List<WorkoutItem> items) {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }
}

class _WorkoutItemAddButton extends StatelessWidget {
  const _WorkoutItemAddButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Card(
        child: MaterialButton(
          onPressed: () {},
          child: const Align(
            alignment: Alignment.center,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
