import 'package:clothes_ecommerce/features/auth/screens/signin_screen.dart';
import 'package:clothes_ecommerce/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => SignInScreen(),
        settings: routeSettings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("This page does not exist"),
          ),
        ),
      );
  }
}
