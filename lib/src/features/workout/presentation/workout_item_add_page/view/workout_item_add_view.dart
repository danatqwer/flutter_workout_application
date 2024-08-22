import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/exercise_type.dart';
import 'package:flutter_workout_application/src/features/workout/domain/types/workout_item_type.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/bloc/workout_item_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_item_add_page/bloc/workout_item_add_bloc_event.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class WorkoutItemAddView extends StatelessWidget {
  const WorkoutItemAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
        leading: BackButton(
          onPressed: () => context.go(MainRoutes.workoutEditPath),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 2.0,
        ),
        child: ListView(
          shrinkWrap: true,
          children: const [
            _WorkoutItemTypeChip(),
          ],
        ),
      ),
    );
  }
}

class _WorkoutItemTypeChip extends StatefulWidget {
  const _WorkoutItemTypeChip();

  @override
  State<_WorkoutItemTypeChip> createState() => _WorkoutItemTypeChipState();
}

class _WorkoutItemTypeChipState extends State<_WorkoutItemTypeChip> {
  WorkoutItemType _value = WorkoutItemType.exercise;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Choose Item type'),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: [
            ChoiceChip(
              label: const Text('Exercise'),
              selected: _value == WorkoutItemType.exercise,
              onSelected: (bool selected) =>
                  setState(() => _value = WorkoutItemType.exercise),
            ),
            ChoiceChip(
              label: const Text('Rest Timer'),
              selected: _value == WorkoutItemType.restTimer,
              onSelected: (bool selected) =>
                  setState(() => _value = WorkoutItemType.restTimer),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        if (_value == WorkoutItemType.exercise) const _ExerciseTypeChip(),
        if (_value == WorkoutItemType.restTimer) const _RestTimerForm()
      ],
    );
  }
}

class _RestTimerForm extends StatefulWidget {
  const _RestTimerForm();

  @override
  State<_RestTimerForm> createState() => _RestTimerFormState();
}

class _RestTimerFormState extends State<_RestTimerForm> {
  final _formKey = GlobalKey<FormState>();

  final _durationTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutItemAddBloc>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _durationTextController,
            decoration: const InputDecoration(
              labelText: 'Rest Duration',
            ),
            validator: (value) => _validator(value, 'Rest Duration'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 16.0),
          _AddButton(
            onPressed: () async {
              final currentState = _formKey.currentState!;
              if (!currentState.validate()) return;

              const uuid = Uuid();
              final id = uuid.v7();
              final duration = int.parse(_durationTextController.text);
              bloc.add(WorkoutItemAddBlocAddEvent(RestTimer(
                id: id,
                duration: duration,
              )));
              await Future.delayed(const Duration(milliseconds: 200), (() {
                context.go(MainRoutes.workoutEditPath);
              }));
            },
          )
        ],
      ),
    );
  }

  String? _validator(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please fill $fieldName field';
    }
    return null;
  }
}

class _ExerciseTypeChip extends StatefulWidget {
  const _ExerciseTypeChip();

  @override
  State<_ExerciseTypeChip> createState() => _ExerciseTypeChipState();
}

class _ExerciseTypeChipState extends State<_ExerciseTypeChip> {
  ExerciseType _value = ExerciseType.repeats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Choose Exercise type'),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          children: [
            ChoiceChip(
              label: const Text('Repeats'),
              selected: _value == ExerciseType.repeats,
              onSelected: (bool selected) {
                setState(() => _value = ExerciseType.repeats);
              },
            ),
            ChoiceChip(
              label: const Text('Timer'),
              selected: _value == ExerciseType.timer,
              onSelected: (bool selected) {
                setState(() => _value = ExerciseType.timer);
              },
            ),
          ],
        ),
        _ExerciseForm(exerciseType: _value)
      ],
    );
  }
}

class _ExerciseForm extends StatefulWidget {
  const _ExerciseForm({
    required this.exerciseType,
  });

  final ExerciseType exerciseType;

  @override
  State<_ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<_ExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();

  final _exerciseValueTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutItemAddBloc>();

    final valueLabel = widget.exerciseType == ExerciseType.repeats
        ? 'Repeats'
        : 'Timer duration';

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTextController,
            validator: (value) => _validator(value, 'Name'),
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: _exerciseValueTextController,
            validator: (value) => _validator(value, valueLabel),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: valueLabel,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 16.0),
          _AddButton(
            onPressed: () async {
              final currentState = _formKey.currentState!;
              if (!currentState.validate()) return;

              const uuid = Uuid();
              final id = uuid.v7();
              final name = _nameTextController.text;
              final type = widget.exerciseType;
              final value = int.parse(_exerciseValueTextController.text);
              bloc.add(WorkoutItemAddBlocAddEvent(Exercise(
                id: id,
                name: name,
                type: type,
                value: value,
              )));
              await Future.delayed(const Duration(milliseconds: 200), (() {
                context.go(MainRoutes.workoutEditPath);
              }));
            },
          )
        ],
      ),
    );
  }

  String? _validator(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please fill $fieldName field';
    }
    return null;
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: const Text('Add'),
      ),
    );
  }
}
