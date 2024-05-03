import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:TrackTheSpend/components/splash.dart';
import 'package:TrackTheSpend/data/expense_data.dart';
import 'package:TrackTheSpend/pages/about.dart';
import 'package:TrackTheSpend/unused/forget_password.dart';
import 'package:TrackTheSpend/pages/home.dart';
import 'package:TrackTheSpend/unused/home_month.dart';
import 'package:TrackTheSpend/unused/login.dart';
import 'package:TrackTheSpend/pages/settings.dart';
import 'package:TrackTheSpend/unused/signup.dart';

void main() async {

  await Hive.initFlutter();

  await Hive.openBox("expense_db");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpenseData())
      ],
      child: MaterialApp(
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash':(context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUp(),
        '/forget': (context) => ForgetPass(),
        '/home': (context) => HomePage(),
        '/homeM':(context) => HomePageMonth(),
        '/setting':(context) => SettingsPage(),
        '/about':(context) => AboutPage()
      },
        ),
    ));
}
