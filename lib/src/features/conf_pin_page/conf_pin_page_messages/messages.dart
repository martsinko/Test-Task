 
import 'package:flutter/material.dart';

class ConfPinCodeMessages{
 static void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Акаунт успішно створено'),
        actions: [
          TextButton(
            onPressed: () {
                Navigator.pushReplacementNamed(context, '/email_page');
            },
            child: Text('Чудово'),
          ),
        ],
      ),
    );
  }

  static void showErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Акаунт не створено'),
        actions: [
          TextButton(
            onPressed: () {
               Navigator.pushReplacementNamed(context, '/conf_pin_code_page');
            },
            child: Text('Повторити'),
          ),
        ],
      ),
    );
  }
 }