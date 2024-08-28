import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/empty_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_edit_page/bloc/workout_edit_bloc_state.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/error_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/loading_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/view/widgets/workout_item_widget/workout_item_widget.dart';
import 'package:go_router/go_router.dart';

class WorkoutEditView extends StatelessWidget {
  const WorkoutEditView({super.key});

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
      title: const _WorkoutNameWidget(),
      leading: BackButton(
        onPressed: () => context.go(MainRoutes.workoutPath),
      ),
      actions: const [
        _SaveButtonListener(),
        SizedBox(width: 2.0),
      ],
    );
  }
}

class _SaveButtonListener extends StatelessWidget {
  const _SaveButtonListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutEditBloc, WorkoutEditBlocState>(
      listenWhen: (previous, current) => current is WorkoutEditBlocSaveState,
      listener: (context, state) => _listener(state, context),
      child: const _SaveButton(),
    );
  }

  void _listener(WorkoutEditBlocState state, BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.removeCurrentSnackBar();

    if (state is WorkoutEditBlocSaveState) {
      final String message;
      if (state.loading) {
        message = 'Saving...';
      } else if (state.errorMessage != null) {
        message = 'Saving failed: ${state.errorMessage}';
      } else if (state.successMessage != null) {
        message = state.successMessage!;
      } else {
        return;
      }

      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(message)),
      );

      if (state.successMessage != null) {
        context.go(MainRoutes.workoutPath);
      }
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Save failed: $state')),
      );
    }
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _onSavePressed(context),
      child: const Text('Save'),
    );
  }

  void _onSavePressed(BuildContext context) {
    final bloc = context.read<WorkoutEditBloc>();
    final state = bloc.state;

    if (state is WorkoutEditBlocInitializeState) {
      bloc.add(WorkoutEditBlocSaveEvent(state.workout));
    } else {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.removeCurrentSnackBar();
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Save failed')),
      );
    }
  }
}

class _WorkoutNameWidget extends StatefulWidget {
  const _WorkoutNameWidget();

  @override
  State<_WorkoutNameWidget> createState() => _WorkoutNameWidgetState();
}

class _WorkoutNameWidgetState extends State<_WorkoutNameWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutEditBloc, WorkoutEditBlocState>(
      buildWhen: (previous, current) =>
          current is WorkoutEditBlocInitializeState,
      builder: (context, state) {
        if (state is! WorkoutEditBlocInitializeState) {
          return const SizedBox();
        }

        if (state.loading) {
          return const LoadingText();
        }
        if (state.errorMessage != null) {
          return FailureText(state.errorMessage ?? '');
        }
        if (state.workout.items.isEmpty) {
          return const IsEmptyText('Items');
        }

        return _WorkoutNameChangeWidget(state.workout);
      },
    );
  }
}

class _WorkoutNameChangeWidget extends StatefulWidget {
  const _WorkoutNameChangeWidget(this.workout);

  final Workout workout;

  @override
  State<_WorkoutNameChangeWidget> createState() =>
      _WorkoutNameChangeWidgetState();
}

class _WorkoutNameChangeWidgetState extends State<_WorkoutNameChangeWidget> {
  bool editing = false;

  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutEditBloc>();

    final workout = widget.workout;
    final name = workout.name;

    _nameTextController.text = workout.name;

    if (!editing) {
      return GestureDetector(
        onTap: () => setState(() => editing = !editing),
        child: Text(name),
      );
    }

    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _nameTextController,
        validator: (value) => _validator(value),
        decoration: const InputDecoration(border: InputBorder.none),
        onEditingComplete: () => _submit(bloc, workout),
        autofocus: true,
        style: DefaultTextStyle.of(context).style,
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this field';
    }
    return null;
  }

  void _submit(WorkoutEditBloc bloc, Workout workout) {
    final currentState = _formKey.currentState!;
    if (!currentState.validate()) return;

    setState(() => editing = !editing);

    final name = _nameTextController.text;
    final updatedWorkout = workout.copyWith(name: name);
    bloc.add(WorkoutEditBlocUpdateEvent(updatedWorkout));
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
      child: _WorkoutItemsWidget(),
    );
  }
}

class _WorkoutItemsWidget extends StatefulWidget {
  const _WorkoutItemsWidget();

  @override
  State<_WorkoutItemsWidget> createState() => _WorkoutItemsWidgetState();
}

class _WorkoutItemsWidgetState extends State<_WorkoutItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutEditBloc, WorkoutEditBlocState>(
      buildWhen: (previous, current) =>
          current is WorkoutEditBlocInitializeState,
      builder: (context, state) {
        if (state is! WorkoutEditBlocInitializeState) {
          return const SizedBox();
        }

        if (state.loading) {
          return const LoadingText();
        }
        if (state.errorMessage != null) {
          return FailureText(state.errorMessage ?? '');
        }
        if (state.workout.items.isEmpty) {
          return const IsEmptyText('Items');
        }

        final workout = state.workout;
        final items = workout.items;

        return ReorderableListView.builder(
          itemBuilder: (context, index) => WorkoutItemWidget(
            key: ValueKey(index),
            item: items[index],
          ),
          itemCount: items.length,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) newIndex -= 1;
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
          footer: const _WorkoutItemAddButton(),
          shrinkWrap: true,
        );
      },
    );
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
          onPressed: () => context.go(MainRoutes.workoutItemAddPath),
          child: const Align(
            alignment: Alignment.center,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
