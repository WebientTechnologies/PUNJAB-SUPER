import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/analog_clock.dart';
import '../../../widgets/counter.dart';
import '../../../widgets/date.dart';

class LuckyPatt extends StatefulWidget {
  const LuckyPatt({super.key});

  @override
  State<LuckyPatt> createState() => _LuckyPattState();
}

class _LuckyPattState extends State<LuckyPatt> {
  int selectedValue = 0;
  int totalSum = 0;
  final Random random = Random();

  final List<String> coins = [
    'assets/img/Coin1Glow.jpg',
    'assets/img/Coin5Glow.jpg',
    'assets/img/Coin10Glow.jpg',
    'assets/img/Coin50Glow.jpg',
    'assets/img/Coin100Glow.jpg',
    'assets/img/Coin500Glow.jpg',
    'assets/img/Coin1000Glow.jpg',
    'assets/img/Coin5000Glow.jpg',
  ];

  // Card Indices ::::
  final List cards = [
    'CHERRY JACK',
    'CHERRY QUEEN',
    'CHERRY KING',
    'HEART JACK',
    'HEART QUEEN',
    'HEART KING',
    'SPADE JACK',
    'SPADE QUEEN',
    'SPADE KING',
    'DIAMOND JACK',
    'DIAMOND QUEEN',
    'DIAMOND KING',
  ];

  List<int> selectedCards = [];
  List<Widget> selectedCardValues = [];
  double width = 0.0;
  void addSelectedCardValueToList(int value, double x, double y, int index) {
    if (selectedValue == 0) return;
    Widget w = Transform.translate(
      offset: Offset(x, y),
      child: Text(
        value.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: width * 0.02,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    totalSum = totalSum + selectedValue;

    // Check if Card Already Exists:

    int i = selectedCards.indexOf(index);

    if (i != -1) {
      selectedCardValues[i] = w;
    } else {
      selectedCardValues.add(w);
      selectedCards.add(index);
    }

    setState(() {});
  }

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
          width = contrainsts.maxWidth;
          var height = contrainsts.maxHeight;
          var x = 0.0;
          var y = 0.0;
          // var ratio = width >= height ? width / height : height / width;
          var ratio = width / height;
          return InkWell(
            onTapDown: (details) {
              x = details.localPosition.dx;
              y = details.localPosition.dy;
              var percentX = x / width;
              var percentY = y / height;
              //  ###########  FOR GETTING NUMBERS ########### //
              if ((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.13 && percentY <= 0.22)) {
                selectedValue = 5;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.23 && percentY <= 0.31))) {
                selectedValue = 10;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.32 && percentY <= 0.41))) {
                selectedValue = 20;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.42 && percentY <= 0.50))) {
                selectedValue = 50;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.51 && percentY <= 0.60))) {
                selectedValue = 100;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.61 && percentY <= 0.70))) {
                selectedValue = 500;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.71 && percentY <= 0.79))) {
                selectedValue = 1000;
              } else if (((percentX >= 0.50 && percentX <= 0.57) &&
                  (percentY >= 0.80 && percentY <= 0.88))) {
                selectedValue = 5000;
              }

              // ################## NUMBERS END #################### //

              // ################## CARDS ########################## //
              // COLUMN 1::::: //
              else if (((percentX >= 0.16 && percentX <= 0.28) &&
                  (percentY >= 0.11 && percentY <= 0.29))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.20 * width,
                  0.29 * height,
                  1,
                );
              } else if (((percentX >= 0.16 && percentX <= 0.28) &&
                  (percentY >= 0.32 && percentY <= 0.49))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.20 * width,
                  0.49 * height,
                  4,
                );
              } else if (((percentX >= 0.16 && percentX <= 0.28) &&
                  (percentY >= 0.51 && percentY <= 0.69))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.20 * width,
                  0.685 * height,
                  7,
                );
              } else if (((percentX >= 0.16 && percentX <= 0.28) &&
                  (percentY >= 0.71 && percentY <= 0.88))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.20 * width,
                  0.88 * height,
                  10,
                );
              }

              // COLUMN 2 :::::::: //

              else if (((percentX >= 0.27 && percentX <= 0.38) &&
                  (percentY >= 0.11 && percentY <= 0.29))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.3 * width,
                  0.29 * height,
                  2,
                );
              } else if (((percentX >= 0.27 && percentX <= 0.38) &&
                  (percentY >= 0.32 && percentY <= 0.49))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.3 * width,
                  0.49 * height,
                  5,
                );
              } else if (((percentX >= 0.27 && percentX <= 0.38) &&
                  (percentY >= 0.51 && percentY <= 0.69))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.3 * width,
                  0.685 * height,
                  8,
                );
              } else if (((percentX >= 0.27 && percentX <= 0.38) &&
                  (percentY >= 0.71 && percentY <= 0.88))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.3 * width,
                  0.88 * height,
                  11,
                );
              }

              // COLUMN 3 :::::::: //

              else if (((percentX >= 0.39 && percentX <= 0.49) &&
                  (percentY >= 0.11 && percentY <= 0.29))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.41 * width,
                  0.29 * height,
                  3,
                );
              } else if (((percentX >= 0.39 && percentX <= 0.49) &&
                  (percentY >= 0.32 && percentY <= 0.49))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.41 * width,
                  0.49 * height,
                  6,
                );
              } else if (((percentX >= 0.39 && percentX <= 0.49) &&
                  (percentY >= 0.51 && percentY <= 0.69))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.41 * width,
                  0.685 * height,
                  9,
                );
              } else if (((percentX >= 0.39 && percentX <= 0.49) &&
                  (percentY >= 0.71 && percentY <= 0.88))) {
                addSelectedCardValueToList(
                  selectedValue,
                  0.41 * width,
                  0.88 * height,
                  12,
                );
              }

              // ################## CARDS END #################### //
            },
            child: Stack(
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
                      width: width,
                      height: height,
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
                      fontSize: width * 0.011,
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
                      fontSize: width * 0.011,
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
                      fontSize: width * 0.011,
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
                    totalSum.toString(),
                    style: TextStyle(
                      fontSize: width * 0.011,
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

                // Showing selected card values:
                ...selectedCardValues.map((e) => e).toList(),

                // ------------- #### ---------------- //
              ],
            ),
          );
        },
      ),
    );
  }
}
