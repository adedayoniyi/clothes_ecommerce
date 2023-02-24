import 'package:clothes_ecommerce/features/auth/screens/sign_up_screen.dart';
import 'package:clothes_ecommerce/features/auth/screens/signin_screen.dart';
import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/widgets/back_button.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: _darkTheme ? Colors.white : const Color(0xFF8F959E),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SignInScreen.routeName,
                    );
                  },
                  child: const Text(
                    " Signin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  borderRadius: BorderRadius.circular(0),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  text: "Create an Account",
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
