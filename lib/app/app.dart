import 'package:flutter/material.dart';
import 'package:flutter_workout_application/app/router/main_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MainRouter.router,
    );
  }
}
