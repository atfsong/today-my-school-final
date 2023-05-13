import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:today_my_school_final/style.dart';

dynamic toast(text) {
  return showToast(
    text,
    duration: const Duration(seconds: 4),
    animDuration: const Duration(seconds: 1),
    position: StyledToastPosition.top,
    startOffset: const Offset(0, -3),
    reverseEndOffset: const Offset(0, -3),
    textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    textStyle: TextStyleSet.light13,
    backgroundColor: ColorPalette.blue.withOpacity(0.5),
    animation: StyledToastAnimation.slideFromTop,
    reverseAnimation: StyledToastAnimation.slideToTop,
    curve: Curves.elasticOut,
    reverseCurve: Curves.fastOutSlowIn,
  );
}
