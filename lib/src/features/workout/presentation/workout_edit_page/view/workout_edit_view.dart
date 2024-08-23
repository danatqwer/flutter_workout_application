import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const _WorkoutNameWidget(),
        leading: BackButton(
          onPressed: () => context.go(MainRoutes.workoutPath),
        ),
        actions: const [
          _SaveButton(),
          SizedBox(width: 2.0),
        ],
      ),
      body: const SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 2.0,
        ),
        child: _WorkoutItemsWidget(),
      ),
    );
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
      builder: (context, state) => switch (state) {
        WorkoutEditBlocLoadingState _ => const Text('Loading...'),
        WorkoutEditBlocFailureState _ => Text(state.message),
        WorkoutEditBlocSuccessState _ => _WorkoutNameChangeWidget(state),
        _ => const SizedBox(),
      },
    );
  }
}

class _WorkoutNameChangeWidget extends StatefulWidget {
  const _WorkoutNameChangeWidget(this.state);

  final WorkoutEditBlocSuccessState state;

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

    final workout = widget.state.workout;
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
        onEditingComplete: () => _submit(bloc),
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

  void _submit(WorkoutEditBloc bloc) {
    final currentState = _formKey.currentState!;
    if (!currentState.validate()) return;

    setState(() => editing = !editing);
    final name = _nameTextController.text;
    final state = bloc.state;
    if (state is WorkoutEditBlocSuccessState) {
      final workout = state.workout.copyWith(name: name);
      bloc.add(WorkoutEditBlocUpdateEvent(workout));
    }
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkoutEditBloc, WorkoutEditBlocState>(
      listenWhen: (previous, current) => current is WorkoutEditBlocSaveState,
      listener: (context, state) => _listener(state, context),
      child: TextButton(
        onPressed: () => _onPressed(context),
        child: const Text('Save'),
      ),
    );
  }

  void _listener(WorkoutEditBlocState state, BuildContext context) {
    final message = switch (state) {
      WorkoutEditBlocSaveLoadingState _ => 'Saving...',
      WorkoutEditBlocSaveFailureState _ => 'Saving failed: ${state.message}',
      WorkoutEditBlocSaveSuccessState _ => 'Saved',
      _ => null,
    };

    if (message == null) return;

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(content: Text(message));

    scaffoldMessenger.removeCurrentSnackBar();
    scaffoldMessenger.showSnackBar(snackBar);
  }

  void _onPressed(BuildContext context) {
    final bloc = context.read<WorkoutEditBloc>();
    final blocState = bloc.state;

    if (blocState is WorkoutEditBlocSuccessState) {
      bloc.add(WorkoutEditBlocSaveEvent(blocState.workout));
      context.go(MainRoutes.workoutPath);
    }
  }
}

class _WorkoutItemsWidget extends StatelessWidget {
  const _WorkoutItemsWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutEditBloc, WorkoutEditBlocState>(
      buildWhen: (previous, current) =>
          current is WorkoutEditBlocInitializeState,
      builder: (context, state) => switch (state) {
        WorkoutEditBlocLoadingState _ => const LoadingText(),
        WorkoutEditBlocFailureState _ => FailureText(state.message),
        WorkoutEditBlocSuccessState _ => _successWidget(state),
        _ => const SizedBox(),
      },
    );
  }

  Widget _successWidget(WorkoutEditBlocSuccessState state) {
    final workout = state.workout;
    final items = workout.items;

    return ReorderableListView.builder(
      itemBuilder: (context, index) => WorkoutItemWidget(
        key: ValueKey(index),
        item: items[index],
      ),
      itemCount: items.length,
      onReorder: (oldIndex, newIndex) => _onReorder(oldIndex, newIndex, items),
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
