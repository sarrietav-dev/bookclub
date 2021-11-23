import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  const NoGroup({Key? key}) : super(key: key);

  static const routeName = "/no-group";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(80),
            child: Image.asset("assets/logo.png"),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}