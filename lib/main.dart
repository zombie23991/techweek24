import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techweek24/home.dart';
import 'package:techweek24/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkTheme ? ThemeData.dark() : ThemeData.light()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'TeckWeek Flutter 2024 ',
      theme: themeProvider.getTheme(),
      home: const Home(),
    );
  }
}
