import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leprekon_program/src/features/registration/presentation/pages/sign_up_messages.dart';
import '../../../../../core/config/components/app_config.dart';
import '../../data/datasources/remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../bloc/sign_up_bloc.dart';
import '../widgets/sign_up_widgets.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
UserRepository signUpRepository = UserRepositoryImpl(
    remoteDataSource: RemoteDataSourceImpl(firebaseAuth: firebaseAuth));

class SignUpPage extends StatelessWidget {

   static String email = '';
    static String password = '';

   SignUpPage({super.key, 
   required this.emailTestController, 
   required this.passwordTestController});
  final TextEditingController emailTestController;
   final  TextEditingController passwordTestController;

     final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

      final bool passwordVisible = true;
       final GlobalKey<FormState> formKey = GlobalKey<FormState>();

       final  CollectionReference collRef = FirebaseFirestore.instance.collection('email adress');
       void addDataToCollection(){
        collRef.add({
          'email': SignUpPage.email
        });
       }
 
  @override
  Widget build(BuildContext context) {
 
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroudColorSignUpPage,
          body: SafeArea(
            child: BlocProvider<SignUpBloc>(
              create: (context) => SignUpBloc(userRepository: UserRepositoryImpl(remoteDataSource:  RemoteDataSourceImpl(firebaseAuth: firebaseAuth))),
              child: BlocListener<SignUpBloc, SignUpState>
              (listener: (context, state){
                if(state is SignUpLoading){
             const  
             Center(child: CircularProgressIndicator());
          }

          if(state is SignUpSuccess){
                 SignUpMessage.showMessage(context);
                 addDataToCollection();  
          }
          
          if(state is SignUpError){
            SignUpMessage.showErrorMessage(context);
            }
              },
            child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight / sb1SignUpPage),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: screenWidth / padLestIconButton),
                        child: BackButtonWidget()),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth / padLeFtAssetImg, top: screenHeight / padRightAssetImg),
                        child: LeprekonImageWidget(),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight / sb2SignUpPage),
                  SignUpTextWidget(),
                  SizedBox(height: screenHeight / sb3SignUpPage),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconEmailWidget(),
                      SizedBox(width: screenWidth / sb4SignUpPage),
                      EmailTextFormFieldWidget(screenWidth: screenWidth, emailController: emailController),
                    ],
                  ),
                  SizedBox(height: screenHeight / sb5SignUpPage),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconPasswordWidget(),
                      SizedBox(width: screenWidth / sb6SignUpPage),
                      PasswordTextFieldWidget(screenWidth: screenWidth, passwordController: passwordController, passwordTestController: passwordTestController,),
                    ],
                  ),
                  SizedBox(height: screenHeight / sb12SignUpPage),
                  SignUpButtonWidget(screenHeight: screenHeight, screenWidth: screenWidth, email: email, password: password, formKey: formKey,),
                  SizedBox(height: screenHeight / sb7SignUpPage),
                  SocialAccTextWidget(),
                  SizedBox(height: screenHeight / sb8SignUpPage),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GoogleIconButtonWidget(screenHeight: screenHeight),
                      SizedBox(width: screenWidth / sb11SignUpPage),
                      FacebookIconButtonWidget(screenHeight: screenHeight)
                    ],
                  ),
                ],
              ),
            ),
          )
        ),
      )
    ),          
   );       
  }
}



















