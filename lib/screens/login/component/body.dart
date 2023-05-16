// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../attendance/attendance_screen.dart';
import '../../forgot/forgot_screen.dart';
import '../../homepage/homepage.dart';
import '../../sign_up/sign_up_screen.dart';
import '../../welcome/component/rounded_button.dart';
import '../login_screen.dart';
import '/constant.dart';
import 'account_check.dart';
import 'forgot_button.dart';
import '../../../widgets/format_dialog.dart';
import 'google_sign_in.dart';
import 'or_divider.dart';
import 'round_outline_button.dart';
import 'rounded_input_field.dart';
import 'rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String email = '';
  String pass = '';

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim());
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.06, bottom: size.height * 0.04),
              child: Text(
                'LOG IN',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
            ),
            RoundedInputField(
              controller: _emailController,
              hintText: 'Email Address',
              labelText: 'Email Address',
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundedPasswordField(
              controller: _passwordController,
              textField: 'Password',
              onChanged: (value) {
                pass = value;
              },
            ),
            ForgotButton(
              textBtn: 'Forgot Password?',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgotScreen();
                    },
                  ),
                );
              },
            ),
            _isLoading
                ? CircularProgressIndicator()
                : RoundedButton(
              press: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  UserCredential userCredential = await FirebaseAuth
                      .instance
                      .signInWithEmailAndPassword(
                    email: email,
                    password: pass,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePageScreen();
                      },
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == "user-not-found") {
                    // Show error dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FormatDialog(
                          styleText: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          styleSubText: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          text: "Login failed",
                          subtext:
                          "User not found. Please check your email and try again.",
                        );
                      },
                    );
                  } else if (e.code == "wrong-password") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FormatDialog(
                          styleText: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          styleSubText: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                          text: "Login failed",
                          subtext:
                          "Wrong email or password. Please try again.",
                        );
                      },
                    );
                  }
                }
                setState(() {
                  _isLoading = false;
                });
              },
              text: 'LOG IN',
            ),
            AccountCheck(
              text: 'Don\'t have an account?',
              textBtn: ' Sign up',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedOutlineButton(
              textBtn: 'Sign in with Google',
              press: () async {
                await FirebaseServices().signInWithGoogle();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()));
              },
              icon: 'assets/icons/google.png',
              margin: size.width * 0.14,
            ),
            RoundedOutlineButton(
              textBtn: 'Sign in with Apple',
              press: () {},
              icon: 'assets/icons/apple-logo.png',
              margin: size.width * 0.15,
            ),
            RoundedOutlineButton(
              textBtn: 'Sign in with Facebook',
              press: () {},
              icon: 'assets/icons/facebook.png',
              margin: size.width * 0.11,
            ),
          ],
        ),
      ),
    );
  }
}


