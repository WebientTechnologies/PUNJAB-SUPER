import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatefulWidget {
  final ratio;
  const DigitalClock({
    super.key,
    this.ratio = 0.0,
  });
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String? _timeString;

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeString = DateFormat('hh:mm:ss a').format(
          DateTime.now(),
        );
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString == null ? '' : '$_timeString',
      style: TextStyle(
        fontSize: widget.ratio * 8,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
