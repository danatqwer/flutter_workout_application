import 'package:flutter/material.dart';
import 'package:flutter_workout_application/src/features/workout/presentation/workout_page/view/widgets/workout_item_widget/workout_item_widget_theme.dart';

class MainTheme {
  MainTheme(this.context);
  final BuildContext context;

  WorkoutItemWidgetColorScheme get colorScheme =>
      WorkoutItemWidgetColorScheme(context);
  WorkoutItemWidgetTheme get theme => WorkoutItemWidgetTheme();

  static MainTheme of(BuildContext context) {
    return MainTheme(context);
  }
}
