import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/sign_up_bloc.dart';
import '../pages/sign_up_page.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.email,
    required this.password, 
    required this.formKey,
  });

  final double screenHeight;
  final double screenWidth;
  final String email;
  final String password;
   final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight / 15,
      width: screenWidth * 0.8,
      child: ElevatedButton(
          onPressed: () {
            
           if(formKey.currentState!.validate())  {
            BlocProvider.of<SignUpBloc>(context).add(SignUpButtonPressed(email: SignUpPage.email, password: password)); 
           }
            },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green),
          child: Text(
            'Gets Start',
            style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          )),
    );
  }
}