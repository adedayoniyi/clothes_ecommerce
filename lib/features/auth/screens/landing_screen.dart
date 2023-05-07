import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/widgets/back_button.dart';
import 'package:clothes_ecommerce/widgets/bottom_bar.dart';
import 'package:clothes_ecommerce/widgets/custom_button.dart';
import 'package:clothes_ecommerce/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var _darkTheme = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomsBackButton(
              onTap: () {},
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Let's Get Started",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                color: Color(0xFF4267B2),
                text: 'Facebook',
                image: 'assets/facebook.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                color: Color(0xFF1DA1F2),
                text: 'Twitter',
                image: 'assets/twitter.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomCard(
                color: Color(0xFFEA4335),
                text: 'Google',
                image: 'assets/google.png',
              ),
            ),
            SizedBox(
              height: size.height / 3.7,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  borderRadius: BorderRadius.circular(0),
                  onPressed: () {
                    Navigator.pushNamed(context, BottomBar.routeName);
                  },
                  text: "Enter the app",
                  fixedSize: Size(size.width, 70),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
