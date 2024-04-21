import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:leprekon_program/my_app.dart';
import 'package:leprekon_program/src/features/registration/data/datasources/remote_datasource.dart';
import 'package:leprekon_program/src/features/registration/data/repositories/user_repository_impl.dart';
import 'core/config/firebase_options/firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailTestController = TextEditingController();
final TextEditingController passwordTestController = TextEditingController();

  runApp(
    MyApp(
      userRepository: UserRepositoryImpl(
        remoteDataSource: RemoteDataSourceImpl(firebaseAuth: firebaseAuth),
      ), emailController: emailController, emailTestController: emailTestController, passwordTestController: passwordTestController,
    ),
  );
}
