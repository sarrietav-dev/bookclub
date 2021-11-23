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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Welcome to Book Club",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: Colors.grey.shade600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Since you are not in a book club, you can select either to join a club or to create a club",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
            ),
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
