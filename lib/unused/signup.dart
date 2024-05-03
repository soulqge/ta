import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left : 25, top: 50,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Hi!",
                      style: TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold, height: 0.5),
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 78,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Let's create an account",
                      style: TextStyle(color: Colors.grey, height: 0.1),
                    ),
                    SizedBox(height: 50),
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
                          SizedBox(
                            width: 315,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          SizedBox(
                            width: 315,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: 'Username',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                          SizedBox(
                            width: 315,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.visibility_off))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Contain atleast 8 character",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('Sign Up'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                          minimumSize: MaterialStateProperty.all(Size(315, 40)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder())),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
