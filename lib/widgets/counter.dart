import 'dart:async';

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  int startMinutes = 1;
  int startSeconds = 0;
  double ratio = 0.0;
  final TextStyle style;
  Counter({
    super.key,
    this.startMinutes = 1,
    this.startSeconds = 0,
    this.ratio = 0.0,
    this.style = const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int startMinute = 1;
  int startSecond = 0;
  final StreamController _streamController = StreamController<List>();
  late Timer _timer;
  void timer({
    int startMinute = 1,
    int startSecond = 0,
  }) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (startMinute == 0 && startSecond == 0) {
          _timer.cancel();
          return;
        }
        if (startSecond == 0) {
          startSecond = 59;
          startMinute--;
        } else {
          startSecond--;
        }
        _streamController.sink.add([startMinute, startSecond]);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startMinute = widget.startMinutes;
    startSecond = widget.startSeconds;
    timer(
      startMinute: startMinute,
      startSecond: startSecond,
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
      builder: (ctx, snapshots) {
        startMinute = snapshots.data?[0] ?? 0;
        startSecond = snapshots.data?[1] ?? 0;
        return Text(
          '${startMinute < 10 ? '0$startMinute' : startMinute}:${startSecond < 10 ? '0$startSecond' : startSecond}',
          style: widget.style,
        );
      },
    );
  }
}
