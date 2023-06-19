import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  final ratio;
  final height;
  final width;
  AnalogClock({
    super.key,
    this.ratio = 0.0,
    this.height,
    this.width,
  });
  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime? _currentTime;

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
        _currentTime = DateTime.now();
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
    return CustomPaint(
      painter: ClockPainter(
        currentTime: _currentTime ?? DateTime.now(),
        ratio: widget.ratio,
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  DateTime currentTime;
  final ratio;
  final height;
  final width;

  ClockPainter({
    required this.currentTime,
    this.ratio,
    this.height,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var clockSize = ratio * 45;
    final double centerX = width * 0.15;
    final double centerY = height * 0.15;
    final double radius = min(centerX, centerY);

    // final paintCircle = Paint()
    //   ..color = Colors.transparent
    //   ..style = PaintingStyle.fill;

    final paintCenter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // canvas.drawCircle(
    //   Offset(centerX, centerY),
    //   radius,
    //   paintCircle,
    // );
    canvas.drawCircle(
      Offset(centerX, centerY),
      ratio * 5,
      paintCenter,
    );

    final double hourX = centerX +
        radius *
            0.35 *
            cos((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    final double hourY = centerY +
        radius *
            0.35 *
            sin((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    canvas.drawLine(Offset(centerX, centerY), Offset(hourX, hourY), paintLine);

    final double minuteX =
        centerX + radius * 0.45 * cos(currentTime.minute * 6 * pi / 180);
    final double minuteY =
        centerY + radius * 0.45 * sin(currentTime.minute * 6 * pi / 180);
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(minuteX, minuteY),
      paintLine,
    );

    final double secondX =
        centerX + radius * 0.48 * cos(currentTime.second * 6 * pi / 180);
    final double secondY =
        centerY + radius * 0.48 * sin(currentTime.second * 6 * pi / 180);
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(secondX, secondY),
      paintLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
