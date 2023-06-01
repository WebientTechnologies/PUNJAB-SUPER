import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/screen/lucky100PS/widgets/dialog_widget.dart';
import 'package:punjabsuper/widgets/counter.dart';

class Lucky100PS extends StatelessWidget {
  Lucky100PS({super.key});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    int num = random.nextInt(100);
    return Scaffold(
      body: LayoutBuilder(builder: (ctx, constrainsts) {
        var height = constrainsts.maxHeight;
        var width = constrainsts.maxWidth;
        var ratio = width / height;
        var style = TextStyle(
          color: Colors.black,
          fontSize: ratio * 9,
          fontWeight: FontWeight.bold,
        );
        return Stack(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/img/SecondMatka.png',
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.fill,
              ),
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
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return Stack(
                        children: [
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
                        ],
                      );
                    },
                  );
                },
                child: Image.asset(
                  'assets/img/CM:JM.png',
                  height: height * 0.05,
                  width: width * 0.1,
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
        );
      }),
    );
  }
}
