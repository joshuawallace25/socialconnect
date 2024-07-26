import 'package:final_project/pages/HomePage.dart';
import 'package:final_project/pages/auth/login_or_registar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//search Method

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user is logged in
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginorRegistar();
        }
      },
    ));
  }
}
