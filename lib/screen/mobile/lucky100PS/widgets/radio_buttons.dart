import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final combinedMaker;
  final jodiMaker;
  final selected;
  final changeSelected;
  final style;
  const RadioButton({
    super.key,
    this.combinedMaker,
    this.jodiMaker,
    this.selected,
    this.style,
    this.changeSelected,
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
        const SizedBox(
          width: 20,
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
