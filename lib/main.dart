import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ta/data/expense_data.dart';
import 'package:ta/pages/forget_password.dart';
import 'package:ta/pages/home.dart';
import 'package:ta/pages/login.dart';
import 'package:ta/pages/signup.dart';

void main() async {

  await Hive.initFlutter();

  await Hive.openBox("expense_db");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ExpenseData())
      ],
      child: MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUp(),
        '/forget': (context) => ForgetPass(),
        '/home': (context) => HomePage(),
      },
        ),
    ));
}
