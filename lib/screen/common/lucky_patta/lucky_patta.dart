import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/screen/common/lucky_patta/widgets/animate.dart';
import 'package:punjabsuper/utils/toast.dart';
import '../../../widgets/analog_clock.dart';
import '../../../widgets/counter.dart';
import '../../../widgets/date.dart';
import 'controllers/get_winner_controller.dart';
import 'controllers/add_cards_controller.dart';
import 'controllers/place_bet_controller.dart';

class LuckyPatty extends StatelessWidget {
  LuckyPatty({
    super.key,
  });

//   @override
//   State<LuckyPatt> createState() => _LuckyPattState();
// }

// class _LuckyPattState extends State<LuckyPatt> {
  int selectedValue = 0;
  int totalSum = 0;
  final Random random = Random();

  var placeBetController = Get.put(
    PlaceBetController(),
  );

  var addCardsController = Get.put(
    AddCardsController(),
  );

  var winnerController = Get.put(
    GetWinnerController(),
  );

  var galleryCards = {
    "DIAMOND": ["00", "10", "11"],
    "CHERRY": ["01", "02", "03"],
    "HEARTS": ["04", "05", "06"],
    "SPADES": ["07", "08", "09"],
  };

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

  // List<int> selectedCards = [];
  // List<Widget> selectedCardValues = [];
  // List<Map<String, dynamic>> cardsChosen = [];
  double width = 0.0;

  Widget getCard(int val, x, y) {
    return Transform.translate(
      offset: Offset(x, y),
      child: Text(
        val.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: width * 0.02,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // int n = random.nextInt(14);

    // print("Card Chosen are $cardsChosen");
    Function addSelectedCardValueToList =
        addCardsController.addSelectedCardValueToList;
    var cardsChosen = addCardsController.cardsChosen;
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, contrainsts) {
          width = contrainsts.maxWidth;
          var height = contrainsts.maxHeight;
          var x = 0.0;
          var y = 0.0;
          // var ratio = width >= height ? width / height : height / width;
          var ratio = width / height;
          return Obx(
            () {
              var selected = winnerController.getLastWinnersList;
              var cardImage = "";
              var cardPathList = [];
              // print(addCardsController.seconds);

              if (selected.isNotEmpty) {
                // var t = galleryCards[selected['card']]![selected['number']];
                // print("T is $t");
                // cardImage = "assets/Taash/$t.png";
                for (var i = 0; i < selected.length; i++) {
                  var t =
                      galleryCards[selected[i]['card']]![selected[i]['number']];
                  cardPathList.add("assets/Taash/$t.png");
                }
                if (cardPathList.isNotEmpty) {
                  cardImage = cardPathList[0];
                }
              }
              return InkWell(
                onTapDown: (details) async {
                  x = details.localPosition.dx;
                  y = details.localPosition.dy;
                  var percentX = x / width;
                  var percentY = y / height;

                  // print('Percent x $percentX $percentY');
                  // BET OKAY BUTTON
                  if ((percentX >= 0.08 && percentX <= 0.14) &&
                      (percentY >= 0.82 && percentY <= 0.86)) {
                    // print('Bet okay');
                    var statusCode =
                        await placeBetController.betOkay(cardsChosen);
                    //Show Toast:
                    if (statusCode == 200) {
                      toast(context, 'Bet Placed Successfully');
                    } else {
                      toast(context, 'Bet Could Not Be Placed');
                    }
                  }

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
                      "CHERRY",
                    );
                  } else if (((percentX >= 0.16 && percentX <= 0.28) &&
                      (percentY >= 0.32 && percentY <= 0.49))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.20 * width,
                      0.49 * height,
                      4,
                      'HEART',
                    );
                  } else if (((percentX >= 0.16 && percentX <= 0.28) &&
                      (percentY >= 0.51 && percentY <= 0.69))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.20 * width,
                      0.685 * height,
                      7,
                      "SPADE",
                    );
                  } else if (((percentX >= 0.16 && percentX <= 0.28) &&
                      (percentY >= 0.71 && percentY <= 0.88))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.20 * width,
                      0.88 * height,
                      10,
                      "DIAMOND",
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
                      "CHERRY",
                    );
                  } else if (((percentX >= 0.27 && percentX <= 0.38) &&
                      (percentY >= 0.32 && percentY <= 0.49))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.3 * width,
                      0.49 * height,
                      5,
                      "HEART",
                    );
                  } else if (((percentX >= 0.27 && percentX <= 0.38) &&
                      (percentY >= 0.51 && percentY <= 0.69))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.3 * width,
                      0.685 * height,
                      8,
                      "SPADE",
                    );
                  } else if (((percentX >= 0.27 && percentX <= 0.38) &&
                      (percentY >= 0.71 && percentY <= 0.88))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.3 * width,
                      0.88 * height,
                      11,
                      "DIAMOND",
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
                      "CHERRY",
                    );
                  } else if (((percentX >= 0.39 && percentX <= 0.49) &&
                      (percentY >= 0.32 && percentY <= 0.49))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.41 * width,
                      0.49 * height,
                      6,
                      "HEART",
                    );
                  } else if (((percentX >= 0.39 && percentX <= 0.49) &&
                      (percentY >= 0.51 && percentY <= 0.69))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.41 * width,
                      0.685 * height,
                      9,
                      "SPADE",
                    );
                  } else if (((percentX >= 0.39 && percentX <= 0.49) &&
                      (percentY >= 0.71 && percentY <= 0.88))) {
                    addSelectedCardValueToList(
                      selectedValue,
                      0.41 * width,
                      0.88 * height,
                      12,
                      "DIAMOND",
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
                        startMinutes: addCardsController.minutes.value,
                        startSeconds: addCardsController.seconds.value,
                        clear: addCardsController.clear,
                        ratio: ratio,
                        type: 1,
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
                    if (cardImage.isNotEmpty)
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
                        }).reversed.toList(),
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
                    // ...selectedCardValues.map((e) => e).toList(),
                    ...cardsChosen
                        .map((e) => getCard(e['points'], e['x'], e['y']))
                        .toList(),

                    // ------------- #### ---------------- //
                    if (addCardsController.minutes < 1 &&
                        addCardsController.seconds < 12)
                      Positioned(
                        bottom: height * 0.101,
                        left: width * 0.168,
                        child: Row(
                          children: [
                            Column(
                              children: List.generate(
                                  4,
                                  (index) => AnimateWidget(
                                        height: height,
                                        width: width,
                                      )),
                            ),
                            Column(
                              children: List.generate(
                                  4,
                                  (index) => AnimateWidget(
                                        height: height,
                                        width: width,
                                      )),
                            ),
                            Column(
                              children: List.generate(
                                  4,
                                  (index) => AnimateWidget(
                                        height: height,
                                        width: width,
                                      )),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
