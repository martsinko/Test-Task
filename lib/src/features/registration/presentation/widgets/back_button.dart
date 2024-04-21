import 'package:flutter/material.dart';
import '../../../../../core/config/components/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
            backgroundColor: colorWhite),
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: colorGrey,
          size: 12,
        ));
  }
}