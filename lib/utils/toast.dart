import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void toast(context, text) {
  showToastWidget(
    Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        )),
    context: context,
    animation: StyledToastAnimation.slideFromBottom,
    reverseAnimation: StyledToastAnimation.slideToBottom,
    position: StyledToastPosition.bottom,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 4),
    curve: Curves.elasticOut,
    reverseCurve: Curves.fastOutSlowIn,
  );
}
