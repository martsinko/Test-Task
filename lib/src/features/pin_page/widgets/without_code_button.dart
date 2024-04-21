import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/components/app_config.dart';

class WithoutCodeTextWidget extends StatelessWidget {
  const WithoutCodeTextWidget({
    super.key,
  });


void showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Акаунт створено'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/email_page');
            },
            child: Text('Продовжити'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        showSuccessMessage(context);
      },
      child: Text(
        withoutCode,
        style: GoogleFonts.mulish(
          color: colorWithoutCode,
          fontSize: 15,
          decoration: TextDecoration.underline,
          decorationColor: colorWithoutCode,
          decorationThickness: 1.5,
        ),
      ),
    );
  }
}