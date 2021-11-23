import 'package:bookclub/pages/home/home.dart';
import 'package:bookclub/pages/login/login.dart';
import 'package:bookclub/pages/no_group/no_group.dart';
import 'package:bookclub/pages/signup/signup.dart';
import 'package:bookclub/providers/current_user.dart';
import 'package:bookclub/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: Consumer<CurrentUser>(
        builder: (context, currentUser, _) => MaterialApp(
          routes: {
            Home.routeName: (context) {
              if (currentUser.isAuth) return const Home();
              return const Login();
            },
            Login.routeName: (context) => const Login(),
            SignUp.routeName: (context) => const SignUp(),
            NoGroup.routeName: (context) => const NoGroup(),
          },
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildTheme(),
        ),
      ),
    );
  }
}
