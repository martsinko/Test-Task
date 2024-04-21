import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/components/app_config.dart';

class FacebookIconButtonWidget extends StatelessWidget {
  const FacebookIconButtonWidget({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
                backgroundColor: colorWhite),
            icon: Icon(Icons.facebook,
                size: 48, color: colorBlue)),
        SizedBox(height: screenHeight / sb13SignUpPage),
        Text(
          facebook,
          style: GoogleFonts.mulish(
              color: colorWhite,
              fontSize: 20,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}