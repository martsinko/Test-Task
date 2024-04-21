import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/components/app_config.dart';


class SetUpPinCodeTextWidget extends StatelessWidget {
  const SetUpPinCodeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      setUpPinCode,
      style: GoogleFonts.mulish(color: colorWhite, fontSize: 22, fontWeight: FontWeight.w600),
    );
  }
}