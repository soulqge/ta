import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 50, top: 50),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Oh, No!",
                style: TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold, height: 0.5),
              ),
              Text(
                "I Forgot",
                style: TextStyle(
                  fontSize: 78,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Enter your email and we'll send you a link",
                style: TextStyle(color: Colors.grey, height: 0.1),
              ),
              SizedBox(height: 15),
              Text(
                "to reset your password",
                style: TextStyle(color: Colors.grey, height: 0.1),
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    width: 315,
                    child: TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              )
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Forget Password'),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStateProperty.all(Size(315, 40)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
