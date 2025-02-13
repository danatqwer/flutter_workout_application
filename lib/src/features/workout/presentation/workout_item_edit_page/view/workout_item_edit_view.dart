import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_routes.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/exercise_type.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/error_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/widgets/loading_text.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_edit_page/bloc/workout_item_edit_bloc_state.dart';
import 'package:go_router/go_router.dart';

class WorkoutItemEditView extends StatelessWidget {
  const WorkoutItemEditView({super.key});

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
      title: const Text('Edit Item'),
      leading: BackButton(
        onPressed: () => context.go(MainRoutes.workoutEditPath),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      child: BlocConsumer<WorkoutItemEditBloc, WorkoutItemEditBlocState>(
        listener: (context, state) => _listener(state, context),
        builder: (context, state) {
          if (state.loading) {
            return const LoadingText();
          }
          if (state.errorMessage != null) {
            return FailureText(state.errorMessage ?? '');
          }

          final bloc = context.read<WorkoutItemEditBloc>();
          final workoutItem = bloc.state.workoutItem;

          if (workoutItem == null) {
            return SizedBox();
          }

          final itemType = workoutItem.itemType;
          final form = switch (itemType) {
            WorkoutItemType.undefined =>
              Center(child: Text('Item type undefined')),
            WorkoutItemType.exercise => const _ExerciseForm(),
            WorkoutItemType.restTimer => const _RestTimerForm(),
          };

          return SingleChildScrollView(child: form);
        },
      ),
    );
  }

  void _listener(WorkoutItemEditBlocState state, BuildContext context) {
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

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.removeCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(message)),
    );

    if (state.successMessage != null) {
      context.go(MainRoutes.workoutEditPath);
    }
  }
}

class _ExerciseForm extends StatefulWidget {
  const _ExerciseForm();

  @override
  State<_ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<_ExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  FormState get currentState => _formKey.currentState!;

  final _nameTextController = TextEditingController();
  final _exerciseValueTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const nameLabel = 'Name';

    final bloc = context.read<WorkoutItemEditBloc>();
    final exercise = bloc.state.workoutItem as Exercise;

    _nameTextController.text = exercise.name;
    _exerciseValueTextController.text = exercise.value.toString();

    final String valueLabel;
    if (exercise.type == ExerciseType.repeats) {
      valueLabel = 'Repeats';
    } else {
      valueLabel = 'Timer duration';
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTextController,
            validator: (value) => _validator(value, nameLabel),
            decoration: const InputDecoration(labelText: nameLabel),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _exerciseValueTextController,
            validator: (value) => _validator(value, valueLabel),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: valueLabel),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 16.0),
          _SaveButton(onPressed: () => _submit(bloc, exercise)),
          const SizedBox(height: 8.0),
          _RemoveButton(onPressed: () => _onRemovePressed(bloc, exercise)),
        ],
      ),
    );
  }

  String? _validator(String? value, String fieldName) =>
      value == null || value.isEmpty ? 'Please fill $fieldName field' : null;

  void _submit(WorkoutItemEditBloc bloc, Exercise exercise) {
    if (currentState.validate()) {
      final value = int.parse(_exerciseValueTextController.text);
      final editedExercise = exercise.copyWith(
        name: _nameTextController.text,
        type: exercise.type,
        value: value,
      );

      bloc.add(WorkoutItemEditBlocSaveEvent(editedExercise));
    }
  }

  void _onRemovePressed(WorkoutItemEditBloc bloc, WorkoutItem workoutItem) {
    final removeEvent = WorkoutItemEditBlocRemoveEvent(workoutItem);
    bloc.add(removeEvent);
  }
}

class _RestTimerForm extends StatefulWidget {
  const _RestTimerForm();

  @override
  State<_RestTimerForm> createState() => _RestTimerFormState();
}

class _RestTimerFormState extends State<_RestTimerForm> {
  final _formKey = GlobalKey<FormState>();
  FormState get currentState => _formKey.currentState!;

  final _durationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const restDurationLabel = 'Rest Duration';

    final bloc = context.read<WorkoutItemEditBloc>();
    final restTimer = bloc.state.workoutItem as RestTimer;

    _durationTextController.text = restTimer.duration.toString();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _durationTextController,
            decoration: const InputDecoration(labelText: restDurationLabel),
            validator: (value) => _validator(value, restDurationLabel),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 16.0),
          _SaveButton(onPressed: () => _onSavePressed(bloc, restTimer)),
          const SizedBox(height: 8.0),
          _RemoveButton(onPressed: () => _onRemovePressed(bloc, restTimer)),
        ],
      ),
    );
  }

  String? _validator(String? value, String fieldName) =>
      value == null || value.isEmpty ? 'Please fill $fieldName field' : null;

  void _onSavePressed(WorkoutItemEditBloc bloc, RestTimer restTimer) {
    if (currentState.validate()) {
      final duration = int.parse(_durationTextController.text);
      final editedRestTimer = restTimer.copyWith(duration: duration);
      final saveEvent = WorkoutItemEditBlocSaveEvent(editedRestTimer);
      bloc.add(saveEvent);
    }
  }

  void _onRemovePressed(WorkoutItemEditBloc bloc, WorkoutItem workoutItem) {
    final removeEvent = WorkoutItemEditBlocRemoveEvent(workoutItem);
    bloc.add(removeEvent);
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: const Text('Save'),
      ),
    );
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: const Text('Remove'),
      ),
    );
  }
}
