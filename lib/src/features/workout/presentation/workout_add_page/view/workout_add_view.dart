import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc_event.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_add_page/bloc/workout_add_bloc_state.dart';
import 'package:go_router/go_router.dart';

class WorkoutAddView extends StatelessWidget {
  const WorkoutAddView({super.key});

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
      title: const Text('Add workout'),
      leading: BackButton(
        onPressed: () => context.go(MainRoutes.workoutListPath),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24),
      child: _Form(),
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
          TextFormField(
            controller: _nameTextController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) => _validator(value),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: BlocListener<WorkoutAddBloc, WorkoutAddBlocState>(
              listener: (context, state) => _listener(state, context),
              child: ElevatedButton(
                onPressed: () => submit(bloc),
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill Name field';
    }
    return null;
  }

  void _listener(WorkoutAddBlocState state, BuildContext context) {
    final successMessage = state.successMessage;
    final errorMessage = state.errorMessage;

    if (successMessage != null) {
      context.go(MainRoutes.workoutListPath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(successMessage)),
      );
    } else if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  void submit(WorkoutAddBloc bloc) {
    final currentState = _formKey.currentState!;
    if (!currentState.validate()) return;

    final name = _nameTextController.text;
    bloc.add(WorkoutAddBlocAddEvent(name));
  }
}
