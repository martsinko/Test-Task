import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/components/app_config.dart';

class SignUpTextWidget extends StatelessWidget {
  const SignUpTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(signUp,
        style: GoogleFonts.mulish(
            fontSize: 24,
            color: colorWhite,
            fontWeight: FontWeight.w900));
  }
}