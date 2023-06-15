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
  List<String> combinations = [];
  double scaleFactor = 0.001;

  Map coordinates = {
    // First Row:
    '01': {'x': 0.0175, 'y': 0.086},
    '02': {'x': 0.076, 'y': 0.086},
    '03': {'x': 0.135, 'y': 0.086},
    '04': {'x': 0.194, 'y': 0.086},
    '05': {'x': 0.252, 'y': 0.086},
    '06': {'x': 0.31, 'y': 0.086},
    '07': {'x': 0.369, 'y': 0.086},
    '08': {'x': 0.427, 'y': 0.086},
    '09': {'x': 0.486, 'y': 0.086},
    '10': {'x': 0.545, 'y': 0.086},
    // Second Row
    '11': {'x': 0.0175, 'y': 0.158},
    '12': {'x': 0.076, 'y': 0.158},
    '13': {'x': 0.135, 'y': 0.158},
    '14': {'x': 0.194, 'y': 0.158},
    '15': {'x': 0.252, 'y': 0.158},
    '16': {'x': 0.31, 'y': 0.158},
    '17': {'x': 0.369, 'y': 0.158},
    '18': {'x': 0.427, 'y': 0.158},
    '19': {'x': 0.486, 'y': 0.158},
    '20': {'x': 0.545, 'y': 0.158},

    // Third Row
    '21': {'x': 0.0175, 'y': 0.23},
    '22': {'x': 0.076, 'y': 0.23},
    '23': {'x': 0.135, 'y': 0.23},
    '24': {'x': 0.194, 'y': 0.23},
    '25': {'x': 0.252, 'y': 0.23},
    '26': {'x': 0.31, 'y': 0.23},
    '27': {'x': 0.369, 'y': 0.23},
    '28': {'x': 0.427, 'y': 0.23},
    '29': {'x': 0.486, 'y': 0.23},
    '30': {'x': 0.545, 'y': 0.23},

    // Fourth Row

    '31': {'x': 0.0175, 'y': 0.302},
    '32': {'x': 0.076, 'y': 0.302},
    '33': {'x': 0.135, 'y': 0.302},
    '34': {'x': 0.194, 'y': 0.302},
    '35': {'x': 0.252, 'y': 0.302},
    '36': {'x': 0.31, 'y': 0.302},
    '37': {'x': 0.369, 'y': 0.302},
    '38': {'x': 0.427, 'y': 0.302},
    '39': {'x': 0.486, 'y': 0.302},
    '40': {'x': 0.545, 'y': 0.302},

    // Fifth Row
    '41': {'x': 0.0175, 'y': 0.374},
    '42': {'x': 0.076, 'y': 0.374},
    '43': {'x': 0.135, 'y': 0.374},
    '44': {'x': 0.194, 'y': 0.374},
    '45': {'x': 0.252, 'y': 0.374},
    '46': {'x': 0.31, 'y': 0.374},
    '47': {'x': 0.369, 'y': 0.374},
    '48': {'x': 0.427, 'y': 0.374},
    '49': {'x': 0.486, 'y': 0.374},
    '50': {'x': 0.545, 'y': 0.374},

    // Sixth Row
    '51': {'x': 0.0175, 'y': 0.446},
    '52': {'x': 0.076, 'y': 0.446},
    '53': {'x': 0.135, 'y': 0.446},
    '54': {'x': 0.194, 'y': 0.446},
    '55': {'x': 0.252, 'y': 0.446},
    '56': {'x': 0.31, 'y': 0.446},
    '57': {'x': 0.369, 'y': 0.446},
    '58': {'x': 0.427, 'y': 0.446},
    '59': {'x': 0.486, 'y': 0.446},
    '60': {'x': 0.545, 'y': 0.446},

    // Seventh Row
    '61': {'x': 0.0175, 'y': 0.518},
    '62': {'x': 0.076, 'y': 0.518},
    '63': {'x': 0.135, 'y': 0.518},
    '64': {'x': 0.194, 'y': 0.518},
    '65': {'x': 0.252, 'y': 0.518},
    '66': {'x': 0.31, 'y': 0.518},
    '67': {'x': 0.369, 'y': 0.518},
    '68': {'x': 0.427, 'y': 0.518},
    '69': {'x': 0.486, 'y': 0.518},
    '70': {'x': 0.545, 'y': 0.518},

    // Eighth Row
    '71': {'x': 0.0175, 'y': 0.59},
    '72': {'x': 0.076, 'y': 0.59},
    '73': {'x': 0.135, 'y': 0.59},
    '74': {'x': 0.194, 'y': 0.59},
    '75': {'x': 0.252, 'y': 0.59},
    '76': {'x': 0.31, 'y': 0.59},
    '77': {'x': 0.369, 'y': 0.59},
    '78': {'x': 0.427, 'y': 0.59},
    '79': {'x': 0.486, 'y': 0.59},
    '80': {'x': 0.545, 'y': 0.59},

    // Ninth Row
    '81': {'x': 0.0175, 'y': 0.66},
    '82': {'x': 0.076, 'y': 0.66},
    '83': {'x': 0.135, 'y': 0.66},
    '84': {'x': 0.194, 'y': 0.66},
    '85': {'x': 0.252, 'y': 0.66},
    '86': {'x': 0.31, 'y': 0.66},
    '87': {'x': 0.369, 'y': 0.66},
    '88': {'x': 0.427, 'y': 0.66},
    '89': {'x': 0.486, 'y': 0.66},
    '90': {'x': 0.545, 'y': 0.66},

    // Tenth Row
    '91': {'x': 0.0175, 'y': 0.73},
    '92': {'x': 0.076, 'y': 0.73},
    '93': {'x': 0.135, 'y': 0.73},
    '94': {'x': 0.194, 'y': 0.73},
    '95': {'x': 0.252, 'y': 0.73},
    '96': {'x': 0.31, 'y': 0.73},
    '97': {'x': 0.369, 'y': 0.73},
    '98': {'x': 0.427, 'y': 0.73},
    '99': {'x': 0.486, 'y': 0.73},
    '00': {'x': 0.545, 'y': 0.73},

    // A Row
    'A1': {'x': 0.0175, 'y': 0.802},
    'A2': {'x': 0.076, 'y': 0.802},
    'A3': {'x': 0.135, 'y': 0.802},
    'A4': {'x': 0.194, 'y': 0.802},
    'A5': {'x': 0.252, 'y': 0.802},
    'A6': {'x': 0.31, 'y': 0.802},
    'A7': {'x': 0.369, 'y': 0.802},
    'A8': {'x': 0.427, 'y': 0.802},
    'A9': {'x': 0.486, 'y': 0.802},
    'A0': {'x': 0.545, 'y': 0.802},

    // B Row
    'B1': {'x': 0.0175, 'y': 0.874},
    'B2': {'x': 0.076, 'y': 0.874},
    'B3': {'x': 0.135, 'y': 0.874},
    'B4': {'x': 0.194, 'y': 0.874},
    'B5': {'x': 0.252, 'y': 0.874},
    'B6': {'x': 0.31, 'y': 0.874},
    'B7': {'x': 0.369, 'y': 0.874},
    'B8': {'x': 0.427, 'y': 0.874},
    'B9': {'x': 0.486, 'y': 0.874},
    'B0': {'x': 0.545, 'y': 0.874},
  };

  // Utility Functions

  void calculateCombineMaker(valueA, points) {
    if (valueA.isNotEmpty) {
      var temp = valueA.split('');
      combinations = [];
      for (var i = 0; i < temp.length; i++) {
        for (var j = 0; j < temp.length; j++) {
          combinations.add(temp[i] + temp[j]);
        }
      }
      // showToast(combinations.toString());
      print(combinations);
      setState(() {});
    }
  }

  void calculateJodiMakers(valueA, valueB, points) {
    if (valueA.isNotEmpty && valueB.isNotEmpty) {
      var temp = valueA.split('');
      var temp1 = valueB.split('');
      combinations = [];
      for (var i = 0; i < temp.length; i++) {
        for (var j = 0; j < temp1.length; j++) {
          combinations.add(temp[i] + temp1[j]);
        }
      }
      // showToast(combinations.toString());
      print(combinations);
      setState(() {});
    }
  }

  void showCMJMDialog(bool value) {
    setState(() {
      showCMJM = value;
    });
  }

  // Widget Functions
  Widget shadeNumber({
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
        radius: ratio * 17,
        backgroundImage: Image.asset(
          'assets/img/blank.png',
        ).image,
        child: Text(
          '1',
          style: TextStyle(
            color: Colors.black,
            fontSize: ratio * 15,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        scaleFactor = 0.002;
        var ratio = width > height ? height * scaleFactor : width * scaleFactor;
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

                ...combinations
                    .map(
                      (e) => shadeNumber(
                        number: int.parse(e),
                        rowConstant: coordinates[e]['x'],
                        columnConstant: coordinates[e]['y'],
                        height: height,
                        width: width,
                        ratio: ratio,
                      ),
                    )
                    .toList(),

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

                // Placing Black Container:
                Positioned(
                  bottom: height * 0.19,
                  right: width * 0.005,
                  child: Container(
                    height: height * 0.28,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Placing Coins:
                // Coin 1
                Positioned(
                  bottom: height * 0.34,
                  right: width * 0.225,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin1Glow.jpg',
                    ).image,
                  ),
                ),

                // Coin 5
                Positioned(
                  bottom: height * 0.34,
                  right: width * 0.15,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin5Glow.jpg',
                    ).image,
                  ),
                ),

                // Coin 10
                Positioned(
                  bottom: height * 0.34,
                  right: width * 0.08,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin10Glow.jpg',
                    ).image,
                  ),
                ),

                // Coin 50
                Positioned(
                  bottom: height * 0.34,
                  right: width * 0.01,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin50Glow.jpg',
                    ).image,
                  ),
                ),

                // Coin 100
                Positioned(
                  bottom: height * 0.23,
                  right: width * 0.22,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin100Glow.jpg',
                    ).image,
                  ),
                ),

                // Coin 500
                Positioned(
                  bottom: height * 0.23,
                  right: width * 0.15,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin500Glow.jpg',
                    ).image,
                  ),
                ),
                // Coin 1000
                Positioned(
                  bottom: height * 0.23,
                  right: width * 0.08,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin1000Glow.jpg',
                    ).image,
                  ),
                ),

                // Coin 5000
                Positioned(
                  bottom: height * 0.23,
                  right: width * 0.01,
                  child: CircleAvatar(
                    radius: ratio * 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: Image.asset(
                      'assets/img/Coin5000Glow.jpg',
                    ).image,
                  ),
                ),

                // CM/JM Button
                Positioned(
                  right: width * 0.3,
                  bottom: height * 0.3,
                  child: InkWell(
                    onTap: () {
                      showCMJMDialog(!showCMJM);
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
                        calculateCombineMaker: calculateCombineMaker,
                        calculateJodiMakers: calculateJodiMakers,
                        showCMJMDialog: showCMJMDialog,
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
