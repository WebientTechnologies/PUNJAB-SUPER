import "dart:math" as math;
import 'package:flutter/material.dart';

class AnimateWidget extends StatefulWidget {
  final height;
  final width;
  const AnimateWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  State<AnimateWidget> createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget> {
  final cards = const [
    "assets/Taash/00.png",
    "assets/Taash/01.png",
    "assets/Taash/02.png",
    "assets/Taash/03.png",
    "assets/Taash/04.png",
    "assets/Taash/05.png",
    "assets/Taash/06.png",
    "assets/Taash/07.png",
    "assets/Taash/08.png",
    "assets/Taash/09.png",
    "assets/Taash/10.png",
    "assets/Taash/11.png",
  ];
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void animate() async {
    int i = 100;
    while (i > 0) {
      i--;
      await Future.delayed(const Duration(
        milliseconds: 150,
      ));
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  Widget build(BuildContext context) {
    int index = math.Random().nextInt(cards.length);
    return Container(
      height: widget.height * 0.18,
      width: widget.width * 0.105,
      margin: const EdgeInsets.only(
        bottom: 8,
        top: 4,
        left: 1,
        right: 1,
      ),
      child: Image.asset(
        cards[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
