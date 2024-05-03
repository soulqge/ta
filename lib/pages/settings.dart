import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:TrackTheSpend/theme/mode.dart';
import 'package:TrackTheSpend/widgets/bottom_nav.dart';

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
          child: Align(
            alignment: Alignment.center,
              child: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          )),
        ),
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[100],
      body: Align(
        alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.nightlight_round),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Night Mode",),
                                        Text("Change Application Theme"),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    // Switch(
                                    //   value: false, 
                                    //   onChanged: mode(),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 128 ,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Column(
                        children: [
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: Colors.transparent,
                          child: InkWell(
                            hoverColor: Colors.black,
                            onTap: () {
                              Navigator.pushNamed(context, '/about');
                            },
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.lightbulb_outline),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("About App",
                                        style: TextStyle(decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Icon(Icons.keyboard_arrow_right)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: Colors.transparent,
                          child: InkWell(
                            hoverColor: Colors.black,
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.logout),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Logout",
                                        style: TextStyle(decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Icon(Icons.keyboard_arrow_right)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        
      ),
      bottomNavigationBar: BottomNav(selectedItem: 1),
    );
  }
}
