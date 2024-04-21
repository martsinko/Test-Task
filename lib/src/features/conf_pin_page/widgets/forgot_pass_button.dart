import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/components/app_config.dart';

class ForgotPassButtonWidget extends StatelessWidget {
  const ForgotPassButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.pushReplacementNamed(context, '/forgot_pin_page');
    }, child: Text(forgotPin, style: GoogleFonts.mulish(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700)),);
  }
}