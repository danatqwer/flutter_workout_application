import 'package:flutter/material.dart';
import 'package:flutter_workout_application/src/app/theme/main_theme.dart';

enum WorkoutItemWidstate { enabled, disabled, selected }

class WorkoutItemWidgetColorScheme {
  WorkoutItemWidgetColorScheme(this.context);

  final BuildContext context;

  Color get enabled => Theme.of(context).colorScheme.surfaceContainerLow;
  Color get disabled => Colors.black26;
  Color get selected => Theme.of(context).colorScheme.onPrimary;
}

class WorkoutItemWidgetTheme {
  WorkoutItemWidgetTheme({this.color});

  final Color? color;

  static WorkoutItemWidgetTheme of(BuildContext context) {
    return MainTheme.of(context).theme;
  }
}
