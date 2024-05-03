import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ta/data/expense_data.dart';
import 'package:ta/pages/about.dart';
import 'package:ta/unused/forget_password.dart';
import 'package:ta/pages/home.dart';
import 'package:ta/unused/home_month.dart';
import 'package:ta/unused/login.dart';
import 'package:ta/pages/settings.dart';
import 'package:ta/unused/signup.dart';

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
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      routes: {
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
