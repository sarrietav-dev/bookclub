import 'package:bookclub/pages/login/login.dart';
import 'package:bookclub/providers/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            CurrentUser currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            await currentUser.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
          },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
