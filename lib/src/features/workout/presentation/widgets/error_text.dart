import 'package:flutter/material.dart';

class FailureText extends StatelessWidget {
  const FailureText(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Failure: data'),
    );
  }
}
