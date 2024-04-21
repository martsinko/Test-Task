import 'package:flutter/material.dart';
import '../../registration/presentation/pages/sign_up_page.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text(SignUpPage.email),
          ),
        ),
      ),
    );
  }
}