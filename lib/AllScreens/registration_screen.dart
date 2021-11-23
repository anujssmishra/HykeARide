import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riderapp/AllScreens/login_screen.dart';
import 'package:riderapp/AllScreens/main_screen.dart';

import '../main.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  static const String idScreen = "register";

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 35.0,
              ),
              const Image(
                image: AssetImage("images/logo.png"),
                width: 120.0,
                height: 120.0,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 1.0,
              ),
              const Text(
                "Register as a Rider",
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: confirmPasswordTextEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      child: const SizedBox(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        RegExp phoneRegex =
                            RegExp(r"^([+][9][1]|[0]){0,1}([0-9]{10})$");
                        if (nameTextEditingController.text.length < 4) {
                          Fluttertoast.showToast(
                              msg: "Name must be at least 4 characters long");
                        } else if (!EmailValidator.validate(
                            emailTextEditingController.text)) {
                          Fluttertoast.showToast(msg: "Invalid email address!");
                        } else if (!phoneRegex
                            .hasMatch(phoneTextEditingController.text)) {
                          Fluttertoast.showToast(msg: "Invalid Mobile Number");
                        } else if (passwordTextEditingController.text.length <
                            8) {
                          Fluttertoast.showToast(
                              msg:
                                  "Password must be at least 8 characters long");
                        } else if (passwordTextEditingController.text !=
                            confirmPasswordTextEditingController.text) {
                          Fluttertoast.showToast(
                              msg: "Passwords do not match!");
                        } else {
                          registerNewUser(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);
                },
                child: const Text(
                  "Already have an Account? Login Here.",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    try {
      final User? firebaseUser =
          (await _firebaseAuth.createUserWithEmailAndPassword(
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text))
              .user;

      if (firebaseUser != null) {
        Map userDataMap = {
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
        };

        userRef.child(firebaseUser.uid).set(userDataMap);
        Fluttertoast.showToast(
            msg: "Congratulations! Your account have been created.");

        Navigator.pushNamedAndRemoveUntil(
            context, MainScreen.idScreen, (route) => false);
      } else {
        Fluttertoast.showToast(msg: "New user account has not been created.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
