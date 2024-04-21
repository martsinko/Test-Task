import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/config/components/app_colors.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: colorWhite),
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios_new, color: colorGrey, size: 12),
    );
  }
}