import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';

class BrandCategories extends StatelessWidget {
  final String icon;
  final String brandName;
  const BrandCategories({
    Key? key,
    required this.icon,
    required this.brandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _darkTheme = true;
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 115,
        height: 50,
        decoration: BoxDecoration(
          color: _darkTheme ? const Color(0xFF29363D) : const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _darkTheme
                    ? const Color(0xFF29363D)
                    : const Color(0xFFFEFEFE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Image.asset(
                icon,
                color: _darkTheme ? Colors.white : Colors.black,
              )),
            ),
            Text(
              brandName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
