import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool centang = false;

  final userController = TextEditingController();
  final userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50,left: 25),
          child: Container(
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
                  "Please enter your detail",
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
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.grey)),
                              controller: userController,
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
                              controller: userPassword,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: Colors.black,
                        activeColor: Colors.grey,
                        value: centang,
                        onChanged: (value) {
                          setState(() {
                            centang = value!;
                          });
                        }),
                    Text("Remember Me"),
                    SizedBox(width: 45),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forget');
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.grey),
                        ))
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('Login'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      minimumSize: MaterialStateProperty.all(Size(315, 40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder())
                      ),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Don't have an account?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
