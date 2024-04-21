import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leprekon_program/src/features/registration/presentation/pages/sign_up_page.dart';

class ForgotPinScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPinController = TextEditingController();

  void resetPin(BuildContext context) async {
    try {
      String newPin = newPinController.text.trim();

      if (emailController.text.trim().isEmpty || newPin.isEmpty) {
        print('Email or new PIN is empty');
        return;
      }

      // Отримати посилання на колекцію "users" в Firestore
      CollectionReference usersCollection = FirebaseFirestore.instance.collection('email adress');

      // Зробити запит до колекції "users" за email
      QuerySnapshot querySnapshot = await usersCollection.where('email', isEqualTo: SignUpPage.email).get();

      // Перевірити, чи є результати запиту
      if (querySnapshot.docs.isNotEmpty) {
        // Отримати перший документ з результатів запиту
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;

        // Оновити пін-код у базі даних
        await userSnapshot.reference.update({
          'pinCode': newPin,
        });

        print('Pin code updated successfully');

        // Показати повідомлення про успішну зміну пін-коду
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Your new PIN has been updated.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context,  '/conf_pin_code_page');
                                     },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        print('User with email $SignUpPage.email not found');
      }
    } catch (e) {
      print('Error resetting PIN: $e');
      // Показати повідомлення про помилку відправки листа або зміну пін-коду
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email to reset your PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Enter your new PIN:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: newPinController,
              decoration: InputDecoration(
                labelText: 'New PIN',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => resetPin(context),
              child: Text('Reset PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
