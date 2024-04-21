import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leprekon_program/src/features/conf_pin_page/home/conf_pin_page.dart';
import 'package:leprekon_program/src/features/conf_pin_page/email_page/email_page.dart';
import 'package:leprekon_program/src/features/forgot_pin/forgot_pin_page.dart';
import 'package:leprekon_program/src/features/pin_page/home/pin_home_page.dart';
import 'package:leprekon_program/src/features/registration/domain/repositories/user_repository.dart';
import 'package:leprekon_program/src/features/registration/presentation/bloc/sign_up_bloc.dart';
import 'package:leprekon_program/src/features/registration/presentation/pages/sign_up_page.dart';

class MyApp extends StatelessWidget {

  
   MyApp({super.key , 
   required this.userRepository, 
   required this.emailController, 
   required this.emailTestController, 
   required this.passwordTestController});

final UserRepository userRepository;
final TextEditingController emailController;
final TextEditingController emailTestController;
final TextEditingController passwordTestController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    routes: {
              '/pin_code_page': (context) =>  PinPage(emailController: emailController),
               '/email_page': (context) => const EmailPage(),
               '/conf_pin_code_page': (context) => const ConfPinPage(enteredPin: '',),
                '/forgot_pin_page': (context) =>  ForgotPinScreen()
    },          
      home: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(userRepository: userRepository),
        
        child: 
    SignUpPage(emailTestController: emailTestController, passwordTestController: passwordTestController,),),
      
      );
    }
  }
