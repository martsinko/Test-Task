import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/sign_up_page.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    required this.screenWidth,
    required this.passwordController, 
    required this.passwordTestController,
  }) : super(key: key);

  final double screenWidth;
  final TextEditingController passwordController;
   final TextEditingController passwordTestController;

  @override
  _PasswordTextFieldWidgetState createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth * 0.6,
      child: TextFormField(
       validator: (valid) {
         if(valid != SignUpPage.password){
                return "Неправильний пароль";
            }
          
          if (valid!.isEmpty) {
            return "Пароль не може бути порожнім";
          }
          if (valid.length < 6) {
            return "Пароль повинен містити принаймні 6 символів";
          }
          if (!RegExp(r'^(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
              .hasMatch(valid)) {
            return "Пароль повинен містити [1,!]";
          }
          return null;
       },
        onChanged: (value) {
          SignUpPage.password = value;
        },
        style: GoogleFonts.mulish(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        controller: widget.passwordController,// widget.passwordTestController,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: (){
            setState(() {
              passwordVisible = !passwordVisible;
            });
          }, icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),),
          labelText: 'Password',
          labelStyle: GoogleFonts.mulish(color: Colors.grey, fontSize: 17),
        ),
      ),
    );
  }
}
