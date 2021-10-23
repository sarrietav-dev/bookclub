import 'package:bookclub/pages/home/home.dart';
import 'package:bookclub/pages/signup/signup.dart';
import 'package:bookclub/providers/current_user.dart';
import 'package:bookclub/widgets/app_card.dart';
import 'package:bookclub/widgets/google_auth_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Image.asset("assets/logo.png"),
                ),
                const _LoginForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            "Login",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => _loginUser(context,
              email: _emailController.text, password: _passwordController.text),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Log in",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed(SignUp.routeName),
          child: const Text("Don't have an account? Sign up here"),
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        ),
        const GoogleAuthButton()
      ],
    ));
  }

  Future<void> _loginUser(BuildContext context,
      {required String email, required String password}) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      await currentUser.logInUser(email: email, password: password);
      Navigator.of(context).pushReplacementNamed(Home.routeName);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green.shade400,
          content: Row(
            children: const [
              Icon(Icons.check_box_outlined, color: Colors.white),
              SizedBox(
                width: 15,
              ),
              Expanded(child: Text("Logged in!"))
            ],
          )));
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case "wrong-password":
          message = "The password is invalid";
          break;
        case "invalid-email":
          message = "The email is invalid";
          break;
        case "user-not-found":
          message = "The user wasn't found";
          break;
        default:
          message = "An error occurred while signing up";
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red.shade400,
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white),
              const SizedBox(
                width: 15,
              ),
              Expanded(child: Text(message))
            ],
          )));
    }
  }
}
