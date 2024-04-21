import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/config/components/app_config.dart';
import '../pages/sign_up_page.dart';

class EmailTextFormFieldWidget extends StatelessWidget {
  const EmailTextFormFieldWidget({
    super.key,
    required this.screenWidth,
    required this.emailController,
  });

  final double screenWidth;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * widthEmailField,
      child: TextFormField(
        onChanged: (text){
                            SignUpPage.email = text;
                          },

        validator: (value) {
            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
        return correctEMail;// Text('Введіть коректну дату');            
      } else{
        return null;
      }
        },
        style: GoogleFonts.mulish(color: colorWhite, fontSize: 18, fontWeight: FontWeight.w500),
        
        controller: emailController,//emailTestController 
        decoration: InputDecoration(
      
          labelStyle: GoogleFonts.mulish(
              color: colorGrey, fontSize: 17),
          labelText: emailAddress,
        ),
      ),
    );
  }
}
