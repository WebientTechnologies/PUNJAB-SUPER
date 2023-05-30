import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/widgets/analog_clock.dart';
import 'package:punjabsuper/widgets/counter.dart';
import 'package:punjabsuper/widgets/date.dart';

class LuckyPatt extends StatelessWidget {
  const LuckyPatt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, contrainsts) {
          var width = contrainsts.maxWidth;
          var height = contrainsts.maxHeight;
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
                top: height * 0.14,
                left: width * 0.015,
                child: AnalogClock(
                  ratio: ratio,
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

              // ------------- #### ---------------- //
            ],
          );
        },
      ),
    );
  }
}
