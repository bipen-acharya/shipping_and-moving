import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../utils/apis.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    log("login user auth ma aayo ");
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var body = json.encode({
      "email": email,
      "password": password,
    });
    log(email.toString());
    log(password.toString());
    http.Response response = await http.post(
      Uri.parse(
        Api.login,
      ),
      headers: headers,
      body: body,
    );
    log("data gayo");
    if (response.statusCode >= 200 && response.statusCode < 300) {
      log("on success");
      onSuccess();
      log("on success katyo ");
    } else {
      var responseBody = jsonDecode(response.body);
      final data = responseBody['data'];
      final error = data['error'];

      log(response.body);
      print(responseBody);
      // log(responseBody["data"]);
      log("message aayo error ko");
      log(error);
      onError(error.toString());
      log(response.body);
    }
  }

  static Future<void> registerUser({
    required String email,
    required String password,
    // required String confirmPassword,
    required String username,
    required String phoneNumber,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    var body = json.encode({
      "email": email,
      "password": password,
      'phone_number': phoneNumber,
      // 'confirm_password': confirmPassword,
      'name': username,
      'type': 2,
    });
    http.Response response = await http.post(
        Uri.parse(
          Api.register,
        ),
        headers: headers,
        body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      onSuccess(userFromJson(response.body));
    } else {
      var responseBody = jsonDecode(response.body);
      final data = responseBody['data'];
      if (data.containsKey('phone_number')) {
        final phoneNumberError = data['phone_number'][0];
        return onError(phoneNumberError.toString());
      }
      if (data.containsKey('email')) {
        final emailError = data['email'][0];
        return onError(emailError.toString());
      }
    }
  }
}
