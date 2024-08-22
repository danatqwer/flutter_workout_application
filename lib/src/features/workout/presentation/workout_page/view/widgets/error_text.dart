import 'package:flutter/material.dart';

class FailureText extends StatelessWidget {
  const FailureText(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(data),
    );
  }
}
