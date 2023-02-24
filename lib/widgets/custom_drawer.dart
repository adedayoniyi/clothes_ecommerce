import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/widgets/general_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
    return Drawer(
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: GeneralCircularButton(
              backgroundColor:
                  _darkTheme ? Color(0xFF222E34) : Color(0xFFF5F6FA),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.menu),
            ),
          ),
          ListTile(
            //tileColor: Colors.green,
            onTap: () {},
            leading: Icon(Icons.person),
            hoverColor: Colors.grey,
            title: Text("My Account"),
          ),
          Switch(
            value: _darkTheme,
            onChanged: (val) {
              setState(() {
                _darkTheme = val;
              });
              onThemeChanged(val, theme);
            },
          ),
        ],
      ),
    );
  }
}
