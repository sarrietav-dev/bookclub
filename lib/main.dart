import 'package:bookclub/pages/login/login.dart';
import 'package:bookclub/providers/current_user.dart';
import 'package:bookclub/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.buildTheme(),
        home: const Login(),
      ),
    );
  }
}
