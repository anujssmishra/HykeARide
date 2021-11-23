import 'package:flutter/material.dart';
import 'package:riderapp/AllScreens/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String idScreen = "register";

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
                    const TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          )),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
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
                        print("Successfully logged in");
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
}
