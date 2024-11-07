import 'package:flutter/material.dart';
import 'package:flutter_workout_application/src/utilities/modified_timer/modified_timer.dart';

class SecondsTimerText extends StatefulWidget {
  const SecondsTimerText({
    super.key,
    required this.seconds,
    this.enable = true,
    this.pause = false,
    this.onTimerEnd,
    this.style,
  });

  final int seconds;
  final bool enable;
  final bool pause;
  final void Function()? onTimerEnd;
  final TextStyle? style;

  @override
  State<SecondsTimerText> createState() => _SecondsTimerTextState();
}

class _SecondsTimerTextState extends State<SecondsTimerText> {
  int seconds = 0;
  ModifiedTimer? timer;

  @override
  void initState() {
    seconds = widget.seconds;
    start();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SecondsTimerText oldWidget) {
    timer?.cancelTimer();
    start();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    timer?.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (timer?.status == ModifiedTimerStatus.notStarted) {
      return Text('${timer?.seconds} seconds');
    }

    if (widget.pause) {
      timer?.pause();
    } else {
      timer?.resume();
    }

    seconds = timer?.currentSecond ?? 0;
    return Text(
      '$seconds seconds',
      style: widget.style,
    );
  }

  void start() {
    timer = ModifiedTimer(
      seconds: seconds,
      onTick: () => setState(() {}),
      onEnd: widget.onTimerEnd,
    );

    if (widget.enable) {
      timer?.start();
    }
  }
}
