import 'dart:async';

enum ModifiedTimerStatus {
  notStarted,
  started,
  ended,
  paused,
  resumed,
}

class ModifiedTimer {
  final int seconds;
  final void Function()? onTick;
  final void Function()? onEnd;

  int _currentSecond = 0;
  ModifiedTimerStatus _status = ModifiedTimerStatus.notStarted;
  Timer? _timer;

  ModifiedTimer({
    required this.seconds,
    this.onTick,
    this.onEnd,
  });

  int get currentSecond => _currentSecond;
  ModifiedTimerStatus get status => _status;

  void _tick() {
    if (_status == ModifiedTimerStatus.paused) return;
    if (_currentSecond > 0) {
      _currentSecond--;
      onTick?.call();
    } else {
      end();
    }
  }

  void start() {
    _currentSecond = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => _tick());
    _status = ModifiedTimerStatus.started;
  }

  void end() {
    onEnd?.call();
    _timer?.cancel();
    _status = ModifiedTimerStatus.ended;
  }

  void reset() {
    _currentSecond = seconds;
    _status = ModifiedTimerStatus.started;
  }

  void resume() {
    _status = ModifiedTimerStatus.resumed;
  }

  void pause() {
    _status = ModifiedTimerStatus.paused;
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}
