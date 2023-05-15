
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../homelayout.dart';
import 'login.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return HomeLayout();
          } else {
            return LoginScreen();
          }
        }),
      ),
    );
  }
}
