import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/components/app_config.dart';


class GoogleIconButtonWidget extends StatelessWidget {
  const GoogleIconButtonWidget({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: heightGoogleIconButton,
            width: widthGoogleIconButton,
            child: IconButton(
                onPressed: () {
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                icon: Image.asset(
                  googleIcon,
                  scale: 0.8,
                ))),
        SizedBox(height: screenHeight / sb10SignUpPage),
        Text(
          google,
          style: GoogleFonts.mulish(
              color: colorWhite,
              fontSize: 20,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
