import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/components/app_config.dart';
import '../../registration/presentation/pages/sign_up_page.dart';
import '../conf_pin_page_messages/messages.dart';
import '../widgets/conf_pin_widgets.dart';

class ConfPinPage extends StatefulWidget {
  const ConfPinPage({Key? key, required this.enteredPin}) : super(key: key);
  final String enteredPin;

  @override
  _ConfPinPageState createState() => _ConfPinPageState();
}

class _ConfPinPageState extends State<ConfPinPage> {
  String enteredConfPin = '';
  bool isPinVisible = false;

  void getPinCodeForUser(BuildContext context) async {
  try {
  
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('email adress');

    QuerySnapshot querySnapshot = await usersCollection.where('email', isEqualTo: SignUpPage.email).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userSnapshot = querySnapshot.docs.first;
      Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

      if (userData != null && userData['pinCode'] != null) {
        String pinCode = userData['pinCode'] as String;
             if(enteredConfPin == pinCode){
                  ConfPinCodeMessages.showMessage(context);
             } else{
                  ConfPinCodeMessages.showErrorMessage(context);
             }
        print('Pin code for user with email $SignUpPage.email is: $pinCode');
      } else {
        print('Pin code not found for user with email $SignUpPage.email');
      }
    } else {
      print('User with email $SignUpPage.email not found');
    }
  } catch (e) {
    print('Error fetching pin code for user: $e');
  }
}

  Widget numButton(int number) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (enteredConfPin.length < 4) {
            enteredConfPin += number.toString();
          }
        });
      },
      child: Text(
        number.toString(),
        style: GoogleFonts.mulish(
          fontSize: 32,
          color: colorWhite,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroudColorPinPage,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: screenHeight / sb1ConfPinPage),
              Padding(
                padding: EdgeInsets.only(right: screenWidth / padRightForgPin),
                child: ForgotPassButtonWidget(),
              ),
              Center(
                child: Column(
                  children: [
                    const LelpreconImageWidget(),
                    SizedBox(height: screenHeight / sb2ConfPinPage),
                    const PinTextWidget(),
                    SizedBox(height: screenHeight / sb3ConfPinPage),
                    PinViewWidget(enteredConfPin: enteredConfPin, isPinVisible: isPinVisible),
                    SizedBox(height: screenHeight / sb4ConfPinPage),
                    Container(
                      decoration: BoxDecoration(
                        color: backgroudColorSignUpPage,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      height: screenHeight * numPanelHeightConfPinPage,
                      width: screenWidth,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight / sb5ConfPinPage),
                          for (var i = 0; i < 3; i++)
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) => numButton(1 + 3 * i + index))
                                    .map((widget) => Padding(
                                          padding: EdgeInsets.symmetric(horizontal: horizontalPading2ConfPin, vertical: verticalPadingConfPin),
                                          child: SizedBox.fromSize(
                                            size: const Size(70, 70), // Збільшити розмір кнопки
                                            child: widget,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPading3ConfPin, vertical: verticalPading2ConfPin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: sb6ConfPinPage),
                                const TextButton(onPressed: null, child: SizedBox()),
                                numButton(0),
                                SizedBox(width: sb7ConfPinPage),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (enteredConfPin.isNotEmpty) {
                                        enteredConfPin = enteredConfPin.substring(0, enteredConfPin.length - 1);
                                      }
                                    });
                                  },
                                  child: Icon(Icons.backspace_outlined, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          
                        SizedBox(height: screenHeight / sb8ConfPinPage),   
                        SizedBox(
                      height: screenHeight / pinCodeButtonHeightConfPin,
                      width: screenWidth * pinCodeButtonWidthConfPin,
                      child: ElevatedButton(
                        onPressed: () {
                            getPinCodeForUser(context);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: colorGreen),
                        child: Text(
                          enter,
                          style: GoogleFonts.mulish(color: colorWhite, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )                    
                       // ConfPinButtonWidget(screenHeight: screenHeight, screenWidth: screenWidth, enteredConfPin: enteredConfPin, getPinCodeForUser: (BuildContext context) {  }, ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
