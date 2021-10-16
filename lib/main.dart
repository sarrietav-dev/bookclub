import 'package:bookclub/pages/login/login.dart';
import 'package:bookclub/pages/signup/signup.dart';
import 'package:bookclub/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(),
      home: const Login(),
    );
  }
}
