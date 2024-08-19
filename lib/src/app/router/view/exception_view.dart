import 'package:flutter/material.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Something went wrong'),
      ),
    );
  }
}
