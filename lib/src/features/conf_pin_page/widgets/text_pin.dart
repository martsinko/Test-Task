import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/components/app_config.dart';

class PinTextWidget extends StatelessWidget {
  const PinTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      pinCode,
      style: GoogleFonts.mulish(color: colorWhite, fontSize: 22, fontWeight: FontWeight.w700),
    );
  }
}