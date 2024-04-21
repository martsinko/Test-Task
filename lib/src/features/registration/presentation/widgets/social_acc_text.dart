import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/config/components/app_colors.dart';
import '../../../../../core/config/components/app_strings.dart';

class SocialAccTextWidget extends StatelessWidget {
  const SocialAccTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      socialAc,
      style: GoogleFonts.mulish(
          color: colorWhite,
          fontSize: 18,
          fontWeight: FontWeight.w400),
    );
  }
}
