import 'package:flutter/material.dart';
import 'package:register/screens/home_screen.dart';
import 'package:register/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// request.auth != null
