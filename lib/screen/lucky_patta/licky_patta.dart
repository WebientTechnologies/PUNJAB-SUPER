import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/widgets/analog_clock.dart';
import 'package:punjabsuper/widgets/counter.dart';
import 'package:punjabsuper/widgets/date.dart';

class LuckyPatt extends StatelessWidget {
  LuckyPatt({super.key});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    int n = random.nextInt(14);
    String cardImage = n < 10 ? 'assets/Taash/0$n.png' : 'assets/Taash/$n.png';
    List<String> cardPathList = [];
    for (var i = 0; i < 5; i++) {
      int n = random.nextInt(12);
      String cardImage =
          n < 10 ? 'assets/OpenNoShow/0$n.png' : 'assets/OpenNoShow/$n.png';
      cardPathList.add(cardImage);
    }
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, contrainsts) {
          var width = contrainsts.maxWidth;
          var height = contrainsts.maxHeight;
          // var ratio = width >= height ? width / height : height / width;
          var ratio = width / height;
          return Stack(
            children: [
              SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image.asset(
                  'assets/img/BackPatti.png',
                  fit: BoxFit.fill,
                  height: height * 1,
                  width: width * 1,
                ),
              ),
              // Date and Digital Clock:
              Positioned(
                left: width * 0.02,
                top: height * 0.05,
                child: SizedBox(
                  height: height * 0.1,
                  width: width * 0.14,
                  child: Date(
                    ratio: ratio,
                  ),
                ),
              ),
              // Analog Clock:
              Positioned(
                top: height * 0.1,
                left: width * -0.073,
                child: AnalogClock(
                  ratio: ratio,
                  height: height,
                  width: width,
                ),
              ),
              // Counter :
              Positioned(
                left: width * 0.05,
                top: height * 0.37,
                child: Counter(
                  startMinutes: 0,
                  startSeconds: 20,
                  ratio: ratio,
                  style: TextStyle(
                    fontSize: ratio * 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Score :
              Positioned(
                left: width * 0.05,
                top: height * 0.533,
                child: Text(
                  '987',
                  style: TextStyle(
                    fontSize: ratio * 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Winner :
              Positioned(
                left: width * 0.05,
                top: height * 0.67,
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: ratio * 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Left Bottom Corner :
              Positioned(
                left: width * 0.05,
                bottom: height * 0.01,
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: ratio * 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Close button
              Positioned(
                left: width * 0.02,
                bottom: height * 0.22,
                child: Image.asset(
                  'assets/img/Close2.png',
                  height: height * 0.07,
                  width: width * 0.1,
                ),
              ),

              // Cancel button
              Positioned(
                left: width * 0.6,
                top: height * 0.133,
                child: Image.asset(
                  'assets/img/Cancel-Bet.png',
                  height: height * 0.07,
                  width: width * 0.1,
                ),
              ),

              // Bottom Right Card:
              Positioned(
                bottom: height * 0.1,
                right: width * 0.02,
                child: Image.asset(
                  cardImage,
                  height: height * 0.2,
                  width: width * 0.1,
                  fit: BoxFit.contain,
                ),
              ),

              // Bottom five Cards:
              Positioned(
                bottom: height * 0.0,
                right: width * 0.15,
                child: Row(
                  children: List.generate(cardPathList.length, (index) {
                    return Image.asset(
                      cardPathList[index],
                      height: height * 0.08,
                      width: width * 0.035,
                      fit: BoxFit.fill,
                    );
                  }),
                ),
              ),

              // Exit
              Positioned(
                bottom: height * 0.0,
                right: width * 0.0,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    'assets/img/exit.png',
                    height: height * 0.07,
                    width: width * 0.13,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // ------------- #### ---------------- //
            ],
          );
        },
      ),
    );
  }
}
