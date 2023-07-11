import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final combinedMaker;
  final jodiMaker;
  final selected;
  final changeSelected;
  final style;
  final width;
  const RadioButton({
    super.key,
    this.combinedMaker,
    this.jodiMaker,
    this.selected,
    this.style,
    this.changeSelected,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio(
              activeColor: Colors.white,
              value: combinedMaker,
              groupValue: selected,
              onChanged: (val) {
                changeSelected(val, 0);
              },
            ),
            Text(
              "COMBINE MAKER",
              style: style,
            ),
          ],
        ),
        SizedBox(
          width: width * 0.001,
        ),
        Row(
          children: [
            Radio(
              activeColor: Colors.white,
              value: jodiMaker,
              groupValue: selected,
              onChanged: (val) {
                changeSelected(val, 1);
              },
            ),
            Text(
              "JODI MAKER",
              style: style,
            ),
          ],
        ),
      ],
    );
  }
}
