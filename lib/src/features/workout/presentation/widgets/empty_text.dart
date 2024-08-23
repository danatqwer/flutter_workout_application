import 'package:flutter/material.dart';

class IsEmptyText extends StatelessWidget {
  const IsEmptyText(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$data is empty'),
    );
  }
}
