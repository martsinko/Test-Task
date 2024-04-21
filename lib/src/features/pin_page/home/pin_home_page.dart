import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/config/components/app_config.dart';
import '../../registration/presentation/pages/sign_up_page.dart';
import '../widgets/pin_home_page_widgets.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key, required this.emailController}) : super(key: key);
  final TextEditingController emailController;

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
 late String enteredPin = '';
  bool isPinVisible = false;
  final TextEditingController emailController = TextEditingController();


  CollectionReference usersCollection = FirebaseFirestore.instance.collection('email adress');

  void pinCodeToUser(BuildContext context) async {
  try {
    QuerySnapshot querySnapshot = await usersCollection.where('email', isEqualTo: SignUpPage.email).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userSnapshot = querySnapshot.docs.first;

      await userSnapshot.reference.set({
        'pinCode': enteredPin,
      }, SetOptions(merge: true));
      print('Пін-код зв\'язаний з користувачем з email: ${SignUpPage.email}');
      Navigator.pushReplacementNamed(context, '/conf_pin_code_page');
    } else {
      print('Користувача з email ${SignUpPage.email} не знайдено');
    }
  } catch (e) {
    print('Помилка при зв\'язуванні пін-коду з користувачем: $e');
  }
}
  

  Widget numButton(int number) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (enteredPin.length < 4) {
            enteredPin += number.toString();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight / sb1PinPage),
              Padding(
                padding: EdgeInsets.only(left: screenWidth / sb2PinPage),
                child: const ButtonBackWidget(),
              ),
              Center(
                child: Column(
                  children: [
                    const LeprekonIconWidget(),
                    SizedBox(height: screenHeight / sb2PinPage),
                    const SetUpPinCodeTextWidget(),
                    SizedBox(height: screenHeight / sb3PinPage),
                    PinCodeViewWidget(enteredPin: enteredPin, isPinVisible: isPinVisible),
                    SizedBox(height: screenHeight / sb4PinPage),
                    Container(
                      decoration: BoxDecoration(
                        color: numPanel,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      height: screenHeight * heightNumPanel,
                      width: screenWidth,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight / sb5PinPage),
                          for (var i = 0; i < 3; i++)
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (index) => numButton(1 + 3 * i + index))
                                    .map((widget) => Padding(
                                          padding: EdgeInsets.symmetric(horizontal: horizontal1Pading, vertical: verticalPading),
                                          child: SizedBox.fromSize(
                                            size: const Size(70, 70), // Збільшити розмір кнопки
                                            child: widget,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontal2Pading),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: sb6PinPage),
                                TextButton(onPressed: null, child: SizedBox()),
                                numButton(0),
                                SizedBox(width: sb7PinPage),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (enteredPin.isNotEmpty) {
                                        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
                                      }
                                    });
                                  },
                                  child: Icon(Icons.backspace_outlined, color: colorWhite),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight / sb8PinPage),
                          SizedBox(
                          height: screenHeight / pinCodeButtonHeight,
                          width: screenWidth * pinCodeButtonWidth,
                          child: ElevatedButton(
                            onPressed: () { 
                                pinCodeToUser(context);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: colorGreen),
                            child: Text(
                              setUp,
                              style: GoogleFonts.mulish(color: colorWhite, fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight / sb9PinPage),
                         const WithoutCodeTextWidget(),
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
