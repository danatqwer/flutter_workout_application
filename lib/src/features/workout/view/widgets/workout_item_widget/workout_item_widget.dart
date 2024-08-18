import 'package:flutter/material.dart';
import 'package:flutter_workout_application/src/app/theme/main_theme.dart';
import 'package:flutter_workout_application/src/features/workout/view/widgets/workout_item_widget/seconds_timer_text_widget.dart';
import 'package:flutter_workout_application/src/features/workout/view/widgets/workout_item_widget/workout_item_widget_theme.dart';
import 'package:workout_repository/workout_repository.dart';

enum WorkoutItemWidgetStatus { enabled, disabled, selected }

class WorkoutItemWidget extends StatelessWidget {
  const WorkoutItemWidget({
    super.key,
    required this.item,
    this.enabled = true,
    this.selected = false,
    this.onTimerEnd,
  });

  final WorkoutItem item;
  final bool enabled;
  final bool selected;
  final void Function()? onTimerEnd;

  @override
  Widget build(BuildContext context) {
    final WorkoutItemWidgetStatus status;
    if (selected) {
      status = WorkoutItemWidgetStatus.selected;
    } else if (enabled) {
      status = WorkoutItemWidgetStatus.enabled;
    } else {
      status = WorkoutItemWidgetStatus.disabled;
    }

    final WorkoutItemWidgetTheme theme = switch (status) {
      WorkoutItemWidgetStatus.enabled => _EnabledTheme(context),
      WorkoutItemWidgetStatus.disabled => _DisabledTheme(context),
      WorkoutItemWidgetStatus.selected => _SelectedTheme(context),
    };

    return Card(
      color: theme.color,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 64,
        child: switch (item.itemType) {
          WorkoutItemType.undefined => const SizedBox(),
          WorkoutItemType.exercise => _ExerciseWidget(
              exercise: item as Exercise,
              selected: selected,
              onTimerEnd: onTimerEnd,
            ),
          WorkoutItemType.restTimer => _RestTimerWidget(
              restTimer: item as RestTimer,
              selected: selected,
              onTimerEnd: onTimerEnd,
            ),
        },
      ),
    );
  }
}

class _ExerciseWidget extends StatelessWidget {
  const _ExerciseWidget({
    required this.exercise,
    this.selected = false,
    this.onTimerEnd,
  });

  final Exercise exercise;
  final bool selected;
  final void Function()? onTimerEnd;

  @override
  Widget build(BuildContext context) {
    final exerciseType = exercise.type;
    final exerciseName = exercise.name;
    final exerciseValue = exercise.value;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 8),
        const Icon(Icons.fitness_center),
        const SizedBox(width: 8),
        Text(exerciseName),
        const Expanded(child: SizedBox()),
        if (exerciseType == ExerciseType.repeats)
          Text('repeats: $exerciseValue'),
        if (exerciseType == ExerciseType.timer)
          SecondsTimerText(
            enable: selected,
            seconds: exerciseValue,
            onTimerEnd: onTimerEnd,
          ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class _RestTimerWidget extends StatelessWidget {
  const _RestTimerWidget({
    required this.restTimer,
    this.selected = false,
    this.onTimerEnd,
  });

  final RestTimer restTimer;
  final bool selected;
  final void Function()? onTimerEnd;

  @override
  Widget build(BuildContext context) {
    final duration = restTimer.duration;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.timer),
        const SizedBox(width: 8),
        SecondsTimerText(
          enable: selected,
          seconds: duration,
          onTimerEnd: onTimerEnd,
        ),
      ],
    );
  }
}

class _EnabledTheme extends WorkoutItemWidgetTheme {
  _EnabledTheme(this.context);

  final BuildContext context;

  @override
  Color get color => MainTheme.of(context).colorScheme.enabled;
}

class _DisabledTheme extends WorkoutItemWidgetTheme {
  _DisabledTheme(this.context);

  final BuildContext context;

  @override
  Color get color => MainTheme.of(context).colorScheme.disabled;
}

class _SelectedTheme extends WorkoutItemWidgetTheme {
  _SelectedTheme(this.context);

  final BuildContext context;

  @override
  Color get color => MainTheme.of(context).colorScheme.selected;
}
