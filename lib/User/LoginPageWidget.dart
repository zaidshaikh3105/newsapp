import 'dart:ui';

import 'package:animated_button/animated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/User/HomePage.dart';
import 'package:newsapp/Services/auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white30,
          title: Text(
            "NEX",
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1566378246598-5b11a0d486cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80"),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                      backgroundColor: Colors.white54,
                      onSurface: Colors.grey,
                      //     side: BorderSide(color: Colors.white, width: 5),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    label: Text('Sign in With Google Account'),
                    icon: Icon(Icons.email_rounded),
                    onPressed: () async {
                      AuthenticationService authenticationService =
                          AuthenticationService(_auth);
                      await authenticationService.gsignIn();

                      if (_auth.currentUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {}
                    })),
          ),
        ),
      ),
    );
  }
}
