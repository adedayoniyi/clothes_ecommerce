import 'package:clothes_ecommerce/features/auth/services/auth_service.dart';
import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/widgets/back_button.dart';
import 'package:clothes_ecommerce/widgets/custom_button.dart';
import 'package:clothes_ecommerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscureText = true;
  var _darkTheme = true;
  bool switchValue = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _signInKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: _signInKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomsBackButton(onTap: () {}),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "Welcome ",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Please enter your data to continue",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF8F959E)),
                      ),
                    ),
                    SizedBox(height: size.height / 6.5),
                    CustomTextField(
                      controller: emailController,
                      labelText: 'Email',
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mail),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      obscureText: obscureText,
                      labelText: 'Password',
                      icon: IconButton(
                        onPressed: () {},
                        icon: obscureText
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = false;
                                  });
                                },
                                child: const Icon(Icons.visibility_off),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    obscureText = true;
                                  });
                                },
                                child: const Icon(Icons.visibility),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgort Password?",
                        style: TextStyle(
                          color: Color(0xFFEA4335),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 45,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Switch(
                                value: switchValue,
                                activeTrackColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 6.5,
                    ),
                    const Center(
                      child: Text(
                        "By Connecting your account confirm that you agree",
                        style: TextStyle(
                          color: Color(0xFF8F959E),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'with our ',
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                          ),
                        ),
                        Text(
                          "Term and Condition",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(0),
                          onPressed: () {
                            if (_signInKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          fixedSize: Size(
                            size.width,
                            70,
                          ),
                          text: 'Login',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
