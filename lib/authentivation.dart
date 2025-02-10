import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = 'https://reqres.in/api/login';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json', // Set content type to JSON
      },
      body: jsonEncode({
        'username': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, login is successful
      return true;
    } else {
      // If the server does not return a 200 OK response, login failed
      ('Login failed: ${response.body}'); // Corrected log to print
      return false;
    }
  }
}
