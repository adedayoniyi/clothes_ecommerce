import 'dart:convert';

import 'package:clothes_ecommerce/constants/error_handling.dart';
import 'package:clothes_ecommerce/constants/global_variables.dart';
import 'package:clothes_ecommerce/constants/utils.dart';
import 'package:clothes_ecommerce/models/user.dart';
import 'package:clothes_ecommerce/providers/user_provider.dart';
import 'package:clothes_ecommerce/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        password: password,
        id: "",
        token: "",
        type: "",
        address: "",
      );
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          //Note:if contenents are misspelt, it could lead to error below
          //'illegal Arguments:Undefined,Number'
          "Content-Type": "application/json; charset=UTF-8"
        },
      );

      httpErrorHandle(
        context: context,
        response: res,
        onSuccess: () {
          showSnackBar(context,
              "Account created successfully,login with same credentials");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          //Note:if contenents are misspelt, it could lead to error below
          //'illegal Arguments:Undefined,Number'
          "Content-Type": "application/json; charset=UTF-8"
        },
      );

      httpErrorHandle(
        context: context,
        response: res,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
          Uri.parse('${GlobalVariables.uri}/tokenIsValid'),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        //get user data
        http.Response userRes = await http.get(
            Uri.parse("${GlobalVariables.uri}/"),
            headers: <String, String>{
              "Content-Type": "application/json; charset=UTF-8",
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
