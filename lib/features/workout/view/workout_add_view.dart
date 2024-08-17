import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workout_application/app/router/utils/constants/main_routes.dart';
import 'package:flutter_workout_application/features/workout/bloc/workout_add_bloc/workout_add_bloc.dart';
import 'package:flutter_workout_application/features/workout/bloc/workout_add_bloc/workout_add_event.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutAddView extends StatelessWidget {
  const WorkoutAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add workout'),
        leading: IconButton(
          onPressed: () => context.go(MainRoutes.workouts),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
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

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WorkoutAddBloc>();

    final nameTextController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameTextController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill Name field';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final currentState = _formKey.currentState;
              if (currentState == null) return;
              if (currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('In Progress')),
                );

                final name = nameTextController.text;
                final workout = Workout(name: name, items: []);
                final event = AddWorkoutEvent(workout);
                bloc.add(event);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}



// class _WorkoutItemTypeChip extends StatefulWidget {
//   const _WorkoutItemTypeChip();

//   @override
//   State<_WorkoutItemTypeChip> createState() => _WorkoutItemTypeChipState();
// }

// class _WorkoutItemTypeChipState extends State<_WorkoutItemTypeChip> {
//   WorkoutItemType _value = WorkoutItemType.exercise;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text('Choose Workout item type'),
//         const SizedBox(height: 8.0),
//         Wrap(
//           spacing: 8.0,
//           children: [
//             ChoiceChip(
//               label: const Text('Exercise'),
//               selected: _value == WorkoutItemType.exercise,
//               onSelected: (bool selected) {
//                 setState(() => _value = WorkoutItemType.exercise);
//               },
//             ),
//             ChoiceChip(
//               label: const Text('Rest Timer'),
//               selected: _value == WorkoutItemType.restTimer,
//               onSelected: (bool selected) {
//                 setState(() => _value = WorkoutItemType.restTimer);
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _ExerciseTypeChip extends StatefulWidget {
//   const _ExerciseTypeChip();

//   @override
//   State<_ExerciseTypeChip> createState() => _ExerciseTypeChipState();
// }

// class _ExerciseTypeChipState extends State<_ExerciseTypeChip> {
//   ExerciseType _value = ExerciseType.repeats;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text('Choose Exercise type'),
//         const SizedBox(height: 8.0),
//         Wrap(
//           spacing: 8.0,
//           children: [
//             ChoiceChip(
//               label: const Text('Exercise'),
//               selected: _value == ExerciseType.repeats,
//               onSelected: (bool selected) {
//                 setState(() => _value = ExerciseType.repeats);
//               },
//             ),
//             ChoiceChip(
//               label: const Text('Rest Timer'),
//               selected: _value == ExerciseType.timer,
//               onSelected: (bool selected) {
//                 setState(() => _value = ExerciseType.timer);
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
