import 'package:flutter/material.dart';
import 'radio_buttons.dart';

class DialogWidget extends StatefulWidget {
  final height;
  final width;
  final ratio;
  final calculateCombineMaker;
  final calculateJodiMakers;
  final showCMJMDialog;
  final totalNumbers;
  final totalValue;
  const DialogWidget({
    super.key,
    this.height,
    this.width,
    this.ratio,
    this.calculateCombineMaker,
    this.calculateJodiMakers,
    this.showCMJMDialog,
    this.totalNumbers,
    this.totalValue,
  });

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  bool combineMaker = true;
  bool jodiMaker = false;
  bool selected = true;
  String valueA = '';
  String valueB = '';
  String points = '';
  final TextStyle style = const TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontFamily: 'Montserrat',
  );
  Widget textField(String label, index, value) {
    return Row(
      children: [
        Text(
          label,
          style: style.copyWith(
            color: Colors.amber,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 100,
          height: 30,
          child: TextField(
            style: style.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: index == 2 ? Colors.cyan[100] : Colors.white,
              hintText: value,
              hintStyle: style.copyWith(
                color: Colors.white,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            onChanged: (val) {
              setState(() {
                if (index == 0) {
                  valueA = val;
                } else if (index == 1) {
                  valueB = val;
                } else if (index == 2) {
                  points = val;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Widget button(String label, int index) {
    return InkWell(
      onTap: () {
        if (index == 1) {
          jodiMaker
              ? widget.calculateJodiMakers(valueA, valueB, points)
              : widget.calculateCombineMaker(valueA, points);
        } else {
          widget.showCMJMDialog(false);
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        height: 40,
        width: 100,
        child: Text(
          label,
          style: style.copyWith(
            color: const Color.fromARGB(255, 10, 102, 177),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void changeSelected(val, index) {
    setState(() {
      // selected = val;
      if (index == 0) {
        combineMaker = true;
        jodiMaker = false;
      } else {
        combineMaker = false;
        jodiMaker = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;
    var ratio = widget.ratio;
    return Container(
      height: height * 0.35,
      width: width * 0.35,
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(
        255,
        3,
        86,
        60,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Radio Buttons
            RadioButton(
              changeSelected: changeSelected,
              combinedMaker: combineMaker,
              jodiMaker: jodiMaker,
              selected: selected,
              style: style,
            ),

            const SizedBox(
              height: 20,
            ),
            // TextFields
            Row(
              children: [
                textField(
                  'VALUE A',
                  0,
                  valueA,
                ),
                const SizedBox(
                  width: 20,
                ),
                if (jodiMaker)
                  textField(
                    'VALUE B',
                    1,
                    valueB,
                  )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Points
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textField(
                  'POINTS',
                  2,
                  points,
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(
                  'Calculate',
                  1,
                ),
                const SizedBox(
                  width: 20,
                ),
                button(
                  'Close',
                  2,
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // Points and Value
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total NO :   ${widget.totalNumbers}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.totalValue}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: widget.width * 0.1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
