import 'package:clothes_ecommerce/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
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
