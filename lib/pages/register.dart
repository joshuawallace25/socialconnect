import 'package:final_project/components/button.dart';
import 'package:final_project/components/text.dart';
import 'package:flutter/material.dart';

//search Method

final _confirmpasswordtextController = TextEditingController();
final _emailtextController = TextEditingController();
final _passwordtextController = TextEditingController();

class Registar extends StatefulWidget {
  final Function()? onTap;
  const Registar({super.key, required this.onTap});

  @override
  State<Registar> createState() => _RegistarState();
}

class _RegistarState extends State<Registar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    "Create a Account!",
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
                  const SizedBox(
                    height: 10,
                  ),
                  //confirm password
                  MyTextField(
                      controller: _confirmpasswordtextController,
                      hintText: 'Confirm Password',
                      obscureText: true),

                  //Sign in button
                  const SizedBox(
                    height: 10,
                  ),

                  //Login

                  MyButton(onTap: () {}, text: 'Sign Up'),
                  //go to register
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an Account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("Login",
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
