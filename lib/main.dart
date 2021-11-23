import 'package:flutter/material.dart';
import 'package:riderapp/AllScreens/login_screen.dart';
import 'package:riderapp/AllScreens/main_screen.dart';
import 'package:riderapp/AllScreens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyke A Ride',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.idScreen,
      routes: {
        RegistrationScreen.idScreen: (context) => const RegistrationScreen(),
        LoginScreen.idScreen: (context) => const LoginScreen(),
        MainScreen.idScreen: (context) => const MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
