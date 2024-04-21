import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {

     TextEditingController emailTestController = TextEditingController();
     TextEditingController passwordTestController = TextEditingController();
  Future<void> login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('Account registered successfully');
      } else {
        print('Registration failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
