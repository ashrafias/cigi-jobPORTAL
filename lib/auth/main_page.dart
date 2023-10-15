import 'package:career_portal/Jobs/job_screen.dart';
//import 'package:career_portal/LoginPage/login_screeen.dart';
import 'package:career_portal/auth/auth_page.dart';
import 'package:career_portal/pages/home_page.dart';
import 'package:career_portal/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return HomePage();
            return JobScreen();
            //return Login();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
