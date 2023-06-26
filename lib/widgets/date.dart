import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:punjabsuper/widgets/digital_clock.dart';

class Date extends StatelessWidget {
  final ratio;
  final width;
  final height;
  const Date({
    super.key,
    this.ratio = 0.0,
    this.width = 0.0,
    this.height = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var month = DateFormat.MMMM().format(date);
    var day = DateFormat.d().format(date);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$month $day',
          style: TextStyle(
            fontSize: width * 0.011,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: ratio * 2,
        ),
        DigitalClock(
          ratio: ratio,
          width: width,
          height: height,
        ),
      ],
    );
  }
}
