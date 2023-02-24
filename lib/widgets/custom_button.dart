import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final BorderRadius borderRadius;
  final VoidCallback onPressed;
  final String text;
  final Size fixedSize;
  const CustomButton({
    Key? key,
    required this.borderRadius,
    required this.onPressed,
    required this.text,
    required this.fixedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _darkTheme = true;
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        fixedSize: fixedSize,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _darkTheme ? Colors.black : Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
