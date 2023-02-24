import 'package:clothes_ecommerce/features/auth/screens/signin_screen.dart';
import 'package:clothes_ecommerce/features/auth/services/auth_service.dart';
import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/widgets/back_button.dart';
import 'package:clothes_ecommerce/widgets/custom_button.dart';
import 'package:clothes_ecommerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;
  var _darkTheme = true;
  bool switchValue = true;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      name: userNameController.text,
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
                key: _signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomsBackButton(onTap: () {}),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height / 6.5),
                    CustomTextField(
                      controller: userNameController,
                      labelText: 'Username',
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person),
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
                      height: 15,
                    ),
                    CustomTextField(
                      controller: emailController,
                      labelText: 'Email Address',
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mail),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                          child: const Text(
                            "Login now?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(0),
                          onPressed: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                          fixedSize: Size(
                            size.width,
                            70,
                          ),
                          text: "Sign Up",
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
