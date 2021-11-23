import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  const NoGroup({Key? key}) : super(key: key);

  static const routeName = "/no-group";

  void _goToCreate() {}
  void _goToJoin() {}

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _goToCreate, child: const Text("Create")),
                ElevatedButton(
                    onPressed: _goToJoin,
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.white)),
                    child: const Text("Join"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
