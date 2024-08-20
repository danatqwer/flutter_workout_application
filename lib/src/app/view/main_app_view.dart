import 'package:flutter/material.dart';
import 'package:flutter_workout_application/src/app/router/main_router.dart';

class MainAppView extends StatelessWidget {
  const MainAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: ThemeData.dark(),
      routerConfig: MainRouter.router,
    );
  }
}
