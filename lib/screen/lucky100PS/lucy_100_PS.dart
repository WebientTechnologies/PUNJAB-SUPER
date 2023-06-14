import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/screen/lucky100PS/widgets/dialog_widget.dart';
import 'package:punjabsuper/widgets/counter.dart';

class Lucky100PS extends StatefulWidget {
  const Lucky100PS({super.key});

  @override
  State<Lucky100PS> createState() => _Lucky100PSState();
}

class _Lucky100PSState extends State<Lucky100PS> {
  bool showCMJM = false;
  final Random random = Random();

  Widget shadeNumber({
    int row = 0,
    int column = 0,
    int number = -1,
    double rowConstant = 0.0,
    double columnConstant = 0.0,
    double height = 0.0,
    double width = 0.0,
    double ratio = 0.0,
  }) {
    if (number == -1) {
      return const SizedBox.shrink();
    }
    // print('row is $row and column is $column and row Conts is $rowConstant');

    return Positioned(
      left: width * rowConstant,
      top: height * columnConstant,
      child: CircleAvatar(
        radius: ratio * 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int num = random.nextInt(100);

    return Scaffold(
      body: LayoutBuilder(builder: (ctx, constrainsts) {
        var height = constrainsts.maxHeight;
        var width = constrainsts.maxWidth;
        var ratio = width / height;
        var percentX = 0.0;
        var percentY = 0.0;

        var style = TextStyle(
          color: Colors.black,
          fontSize: ratio * 9,
          fontWeight: FontWeight.bold,
        );
        return MouseRegion(
          onHover: (event) {
            var x = event.position.dx;
            var y = event.position.dy;

            percentX = x / width;
            percentY = y / height;
          },
          child: InkWell(
            // onTapDown: (details) {
            //   print('Position is ${details.localPosition}');
            // },
            onTap: () {
              // 01 : 0.013 and 0.086
              print('Position is $percentX and $percentY');
            },
            child: Stack(
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/img/SecondMatka.png',
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
                ),

                // ...List.generate(
                //   10,
                //   (index) => shadeNumber(
                //     row: index + 1,
                //     column: index + 1,
                //     number: index + 1,
                //     percentX: percentX,
                //     percentY: percentY,
                //     height: height,
                //     width: width,
                //     ratio: ratio,
                //   ),
                // ),
                shadeNumber(
                  row: 1,
                  column: 1,
                  number: 1,
                  rowConstant: 0.0175,
                  columnConstant: 0.086,
                  height: height,
                  width: width,
                  ratio: ratio,
                ),

                // Score :
                Positioned(
                  top: height * 0.05,
                  left: width * 0.05,
                  child: Text(
                    '803.00',
                    style: style,
                  ),
                ),

                // Counter:
                Positioned(
                  top: height * 0.05,
                  left: width * 0.28,
                  child: Counter(
                    ratio: ratio,
                    startMinutes: 5,
                    startSeconds: 0,
                    style: style,
                  ),
                ),

                // Winner
                Positioned(
                  top: height * 0.05,
                  left: width * 0.5,
                  child: Text(
                    '9',
                    style: style,
                  ),
                ),

                // Cancel button
                Positioned(
                  left: width * 0.6,
                  top: height * 0.133,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/img/Cancel-Bet.png',
                      height: height * 0.07,
                      width: width * 0.1,
                    ),
                  ),
                ),

                // Cancel All button
                Positioned(
                  left: width * 0.6,
                  top: height * 0.07,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/img/CancelAll.png',
                      height: height * 0.07,
                      width: width * 0.1,
                    ),
                  ),
                ),

                // Close button
                Positioned(
                  left: width * 0.65,
                  top: height * 0.02,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/img/Close2.png',
                      height: height * 0.05,
                      width: width * 0.1,
                    ),
                  ),
                ),

                // Number Selector:

                Positioned(
                  right: width * 0.04,
                  top: height * 0.03,
                  child: Text(
                    num < 10 ? '0$num' : num.toString(),
                    style: style.copyWith(
                      fontSize: ratio * 40,
                    ),
                  ),
                ),

                // CM/JM Button
                Positioned(
                  right: width * 0.3,
                  bottom: height * 0.3,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showCMJM = !showCMJM;
                      });
                    },
                    child: Image.asset(
                      'assets/img/CM:JM.png',
                      height: height * 0.05,
                      width: width * 0.1,
                    ),
                  ),
                ),

                // CM/JM Dialog
                if (showCMJM)
                  Positioned(
                    right: 0,
                    bottom: height * 0.35,
                    child: Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 10.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: DialogWidget(
                        height: height,
                        width: width,
                        ratio: ratio,
                      ),
                    ),
                  ),

                // Take Button
                Positioned(
                  right: width * 0.257,
                  bottom: height * 0.08,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/img/Take.png',
                      height: height * 0.0499,
                      width: width * 0.15,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Bet Ok Button
                Positioned(
                  right: 0,
                  bottom: height * 0.08,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/img/BetOk.png',
                      height: height * 0.0499,
                      width: width * 0.15,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                // Exit Button
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/img/Exit 2.png',
                      height: height * 0.0499,
                      width: width * 0.085,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
