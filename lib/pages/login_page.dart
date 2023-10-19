//import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
//import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  Future signIn() async {
    log("In sign In");
    var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailContoller.text.trim(),
      password: _passwordContoller.text.trim(),
    );
    log(user.user?.displayName ?? "");
    log("out of function");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailContoller.dispose();
    _passwordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Stack(),
      backgroundColor: Colors.grey[300],
      //child: Image.asset('assets/images/cigi-logo.jog', height:  160,),

      body: SafeArea(
        //body : Stack()
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'assets/images/wallpaper.jpg',
                    height: 240,
                  ),
                ),

                //SizedBox(height: 75),
                Text(
                  'Welcome ! ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "CIGI CAREER PORTAL, QATAR",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //email textfild
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailContoller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "Email",
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                //    ),
                //),
                SizedBox(height: 10),
                //password text field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordContoller,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // sign in button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      log("Clicked");
                      await signIn();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        " Register now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                //not  a member register now
              ],
            ),
          ),
        ),
      ),
      // ),
      //),
    );
  }
}
