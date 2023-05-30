import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:punjabsuper/widgets/digital_clock.dart';

class Date extends StatelessWidget {
  final ratio;
  const Date({
    super.key,
    this.ratio = 0.0,
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
            fontSize: ratio * 8,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: ratio * 2,
        ),
        DigitalClock(
          ratio: ratio,
        ),
      ],
    );
  }
}
