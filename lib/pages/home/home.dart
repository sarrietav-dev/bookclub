import 'package:bookclub/pages/login/login.dart';
import 'package:bookclub/providers/current_user.dart';
import 'package:bookclub/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppCard(
                child: Column(
              children: [
                Text(
                  "Harry Potter and the Sorcerer's Stone",
                  style: TextStyle(fontSize: 30, color: Colors.grey.shade600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        "Due In: ",
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade600),
                      ),
                      const Text(
                        "8 days",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Finished Book",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppCard(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next Book Revealed In: ",
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade600),
                      ),
                      const Text(
                        "22 hours",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Book Club History"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () => _signOut(context),
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor, width: 2)),
            ),
          )
        ],
      ),
    );
  }

  void _signOut(BuildContext context) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    await currentUser.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Login.routeName, (route) => false);
  }
}
