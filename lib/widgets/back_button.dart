import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomsBackButton extends StatelessWidget {
  final VoidCallback onTap;
  CustomsBackButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  var _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: _darkTheme ? const Color(0xFFF5F6FA) : const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(25),
        ),
        child: BackButton(
          onPressed: onTap,
          color: _darkTheme ? Colors.black : Colors.black,
        ),
      ),
    );
  }
}
