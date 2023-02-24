import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  var _darkTheme = true;
  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Switch(
            value: _darkTheme,
            onChanged: (val) {
              setState(() {
                _darkTheme = val;
              });
              onThemeChanged(val, theme);
            },
          ),
          const Text("Hello World"),
          CustomsBackButton(onTap: () {})
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _darkTheme ? Colors.red : Colors.yellow,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
