import 'package:flutter/material.dart';

class TokenIDReport extends StatelessWidget {
  final height;
  final width;
  final ratio;
  const TokenIDReport({
    super.key,
    this.height,
    this.width,
    this.ratio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.5,
      width: width * 0.6,
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 123, 162, 203),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.08,
                ),
                const Text(
                  'Token Id\'s Report',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 93, 38, 34),
                    decoration: TextDecoration.underline,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 93, 38, 34),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/PattiOpenS.png',
                  height: height * 0.32,
                  width: width * 0.22,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/img/PattiOpen_Lucky100S.png',
                  height: height * 0.32,
                  width: width * 0.22,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
