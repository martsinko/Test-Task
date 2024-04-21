import 'package:flutter/material.dart';

class SignUpMessage {
  static void showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Вас успішно зареєстровано'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/pin_code_page');
            },
            child: Text('Продовжити'),
          ),
        ],
      ),
    );
  }

  static void showErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Не зареєстровано'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Попробувати ще раз'),
          ),
        ],
      ),
    );
  }
}
