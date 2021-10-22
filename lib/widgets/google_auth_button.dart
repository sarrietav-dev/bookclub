import 'package:bookclub/providers/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.grey,
            elevation: 0,
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        onPressed: () async {
          CurrentUser currentUser =
              Provider.of<CurrentUser>(context, listen: false);

          await currentUser.googleSignIn();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Image(
                image: AssetImage("assets/google_logo.png"),
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              )
            ],
          ),
        ));
  }
}
