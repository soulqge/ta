import 'package:flutter/material.dart';
import 'package:ta/widgets/bottom_nav.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(child: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              ),
            )
            ),
        ),

        leading: Padding(
          padding: EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/home');
            }, 
            icon: Icon(Icons.arrow_back)),
        ),
      ),
      body: Container(

      ),
      bottomNavigationBar: BottomNav(selectedItem: 1),
    );
  }
}