import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/config/components/app_colors.dart';

class PinCodeViewWidget extends StatelessWidget {
  const PinCodeViewWidget({
    super.key,
    required this.enteredPin,
    required this.isPinVisible,
  });

  final String enteredPin;
  final bool isPinVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          bool isFilled = index < enteredPin.length;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: isPinVisible ? 70 : 34,
            width: isPinVisible ? 70 : 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
             
              color: isFilled ? (isPinVisible ? colorGreen : colorWhite) : colorTransp,
              border: Border.all(
                color: isFilled ? Colors.transparent : colorWhite, // Білий колір для обводки
                width: 4, // Товщина обводки
              ),
            ),
          );
        }),
      );
  }
}