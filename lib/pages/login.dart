import 'package:final_project/components/button.dart';
import 'package:final_project/components/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//search Method

final _emailtextController = TextEditingController();
final _passwordtextController = TextEditingController();

void login() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailtextController.text, password: _passwordtextController.text);
}

class MyHomePage extends StatefulWidget {
  final Function()? onTap;
  const MyHomePage({super.key, required this.onTap});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo
                  const Text(
                    "Social Connect",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  //Welcome back
                  const Text(
                    "Welcome Back You've been missed!",
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //email text
                  MyTextField(
                      controller: _emailtextController,
                      hintText: 'Email / Phone Number',
                      obscureText: false),

                  const SizedBox(
                    height: 10,
                  ),

                  //password text
                  MyTextField(
                      controller: _passwordtextController,
                      hintText: 'Password',
                      obscureText: true),

                  //Sign in button
                  const SizedBox(
                    height: 10,
                  ),

                  //Login

                  const MyButton(onTap: login, text: 'Login'),
                  //go to register
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("Register now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
