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
  final jodiMaker;
  final combineMaker;
  final changeJodiMakerCombineMaker;
  final changeSelected;
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
    this.jodiMaker,
    this.combineMaker,
    this.changeJodiMakerCombineMaker,
    this.changeSelected,
  });

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  bool selected = true;
  String valueA = '';
  String valueB = '';
  String points = '';
  TextStyle style = const TextStyle();

  Widget textField(String label, index, value) {
    return Row(
      children: [
        Text(
          label,
          style: style.copyWith(
            color: Colors.amber,
            fontSize: widget.width * 0.011,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: widget.width * 0.01,
        ),
        SizedBox(
          width: widget.width * 0.07,
          height: widget.height * 0.05,
          child: TextField(
            style: style.copyWith(
              color: Colors.black,
              fontSize: widget.width * 0.011,
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
        widget.changeJodiMakerCombineMaker(
          index,
          valueA,
          valueB,
          points,
        );
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
        height: widget.height * 0.05,
        width: widget.width * 0.09,
        child: Text(
          label,
          style: style.copyWith(
            color: const Color.fromARGB(255, 10, 102, 177),
            fontSize: widget.width * 0.011,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = widget.height;
    var width = widget.width;

    style = TextStyle(
      color: Colors.white,
      fontSize: widget.width * 0.011,
      fontFamily: 'Montserrat',
    );
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
              changeSelected: widget.changeSelected,
              combinedMaker: widget.combineMaker,
              jodiMaker: widget.jodiMaker,
              selected: selected,
              style: style,
              width: width,
            ),

            SizedBox(
              height: height * 0.03,
            ),
            // TextFields
            Row(
              children: [
                textField(
                  'VALUE A',
                  0,
                  valueA,
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                if (widget.jodiMaker)
                  textField(
                    'VALUE B',
                    1,
                    valueB,
                  )
              ],
            ),
            SizedBox(
              height: height * 0.03,
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
                SizedBox(
                  width: width * 0.005,
                ),
                button(
                  'Close',
                  2,
                ),
              ],
            ),

            SizedBox(
              height: height * 0.03,
            ),

            // Points and Value
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total NO :   ${widget.totalNumbers}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.011,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.totalValue}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.011,
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
