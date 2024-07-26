import 'package:final_project/pages/login.dart';
import 'package:final_project/pages/register.dart';
import 'package:flutter/material.dart';

//search Method

class LoginorRegistar extends StatefulWidget {
  const LoginorRegistar({
    super.key,
  });

  @override
  State<LoginorRegistar> createState() => _LoginorRegistarState();
}

class _LoginorRegistarState extends State<LoginorRegistar> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return MyHomePage(onTap: togglePages);
    } else {
      return Registar(onTap: togglePages);
    }
  }
}
