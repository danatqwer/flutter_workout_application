import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/domain/model/models.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc_event.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class WorkoutAddView extends StatelessWidget {
  const WorkoutAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add workout'),
        leading: BackButton(
          onPressed: () => context.go(MainRoutes.workoutListPath),
        ),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: _Form(),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final _formKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutAddBloc>();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NameTextFormField(controller: _nameTextController),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: _AddButton(onPressed: () => submit(bloc)),
          ),
        ],
      ),
    );
  }

  void submit(WorkoutAddBloc bloc) {
    final currentState = _formKey.currentState!;
    if (!currentState.validate()) return;

    final name = _nameTextController.text;
    const uuid = Uuid();
    final workout = Workout(
      id: uuid.v7(),
      name: name,
      items: [],
    );

    bloc.add(WorkoutAddBlocAddEvent(workout));

    context.go(MainRoutes.workoutListPath);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Workout added')),
    );
  }
}

class _NameTextFormField extends StatelessWidget {
  const _NameTextFormField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (value) => _validator(value),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill Name field';
    }
    return null;
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: const Text('Add'),
    );
  }
}
