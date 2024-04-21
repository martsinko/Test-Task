import 'package:flutter/material.dart';
import '../../../../core/config/components/app_config.dart';

class PinViewWidget extends StatelessWidget {
  const PinViewWidget({
    super.key,
    required this.enteredConfPin,
    required this.isPinVisible,
  });

  final String enteredConfPin;
  final bool isPinVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          bool isFilled = index < enteredConfPin.length;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: horizontalPadingConfPin),
            height: isPinVisible ? 70 : 34,
            width: isPinVisible ? 70 : 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
             
              color: isFilled ? (isPinVisible ? colorGreen : colorWhite) : colorTransp,
              border: Border.all(
                color: isFilled ? colorTransp : colorWhite, // Білий колір для обводки
                width: 4, // Товщина обводки
              ),
            ),
          );
        }),
      );
  }
}
