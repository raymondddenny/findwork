import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:work/constants.dart';
import 'package:work/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  Future<UserModel> registerUser(
      {required String email,
      required String password,
      required String name,
      required String goal}) async {
    try {
      Map<String, dynamic> body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal
      };

      final response = await http.post(
        Uri.parse("$url/register"),
        body: body,
      );

      print(response.statusCode);
      print("result register -> " + response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return UserModel.fromJsonError(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return UserModel.fromJsonError(jsonDecode(e.toString()));
    }
  }

  Future<UserModel> singInUser({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> body = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse("$url/login"),
        body: body,
      );

      print(response.statusCode);
      print("result login -> " + response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return UserModel.fromJsonError(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return UserModel.fromJsonError(jsonDecode(e.toString()));
    }
  }
}
