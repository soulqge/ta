import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime()async{
    return Timer(
      Duration(seconds: 2),
       () => Navigator.of(context).pushReplacementNamed('/home')
      );
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text("TrackTheSpend")
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Versi 1.0", // sesuasi sama versi asli e
                  style: TextStyle(color: CupertinoColors.black),
                  )
                ),
              )     
          ],
        ),
      ),
    );
  }
}