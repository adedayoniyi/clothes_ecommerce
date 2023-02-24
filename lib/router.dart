import 'package:clothes_ecommerce/features/admin/screens/add_product_screen.dart';
import 'package:clothes_ecommerce/features/auth/screens/sign_up_screen.dart';
import 'package:clothes_ecommerce/features/auth/screens/signin_screen.dart';
import 'package:clothes_ecommerce/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignInScreen(),
        settings: routeSettings,
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
        settings: routeSettings,
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
        settings: routeSettings,
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
        settings: routeSettings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Screen dosen\'t exist")),
        ),
      );
  }
}
