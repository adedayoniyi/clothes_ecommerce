import 'package:clothes_ecommerce/features/auth/screens/landing_screen.dart';
import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? false;
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen(),
    );
  }
}
