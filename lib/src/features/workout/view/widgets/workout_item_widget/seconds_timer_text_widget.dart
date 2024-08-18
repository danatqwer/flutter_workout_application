import 'dart:async';

import 'package:flutter/material.dart';

class SecondsTimerText extends StatefulWidget {
  const SecondsTimerText({
    super.key,
    required this.seconds,
    this.enable = true,
    this.onTimerEnd,
    this.style,
  });

  final int seconds;
  final bool enable;
  final void Function()? onTimerEnd;
  final TextStyle? style;

  @override
  State<SecondsTimerText> createState() => _SecondsTimerTextState();
}

class _SecondsTimerTextState extends State<SecondsTimerText> {
  Timer? timer;
  int duration = 0;
  bool isStarted = false;

  void start() {
    duration = widget.seconds;
    isStarted = true;
    final onTimerEnd = widget.onTimerEnd;
    const period = Duration(seconds: 1);
    timer = Timer.periodic(period, (timer) {
      if (duration > 0) return setState(() => duration--);
      if (onTimerEnd != null) onTimerEnd();
      timer.cancel();
    });
  }

  @override
  void initState() {
    if (widget.enable && !isStarted) start();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SecondsTimerText oldWidget) {
    timer?.cancel();
    isStarted = false;
    if (widget.enable && !isStarted) start();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isStarted) {
      return Text('${widget.seconds} seconds');
    }
    return Text(
      '$duration seconds',
      style: widget.style,
    );
  }
}
