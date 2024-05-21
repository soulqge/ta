import 'package:TrackTheSpend/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:TrackTheSpend/components/splash.dart';
import 'package:TrackTheSpend/data/expense_data.dart';
import 'package:TrackTheSpend/pages/about.dart';
import 'package:TrackTheSpend/pages/home.dart';
import 'package:TrackTheSpend/pages/settings.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox("expense_db");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpenseData()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            initialRoute: '/splash',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            routes: {
              '/splash': (context) => SplashScreen(),
              '/home': (context) => HomePage(),
              '/setting': (context) => SettingsPage(),
              '/about': (context) => AboutPage(),
            },
          );
        },
      ),
    ),
  );

}
