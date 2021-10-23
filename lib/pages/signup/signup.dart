import 'package:bookclub/providers/current_user.dart';
import 'package:bookclub/widgets/app_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = "/signup";

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
                Row(
                  children: const [
                    BackButton(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const _SignUpForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({Key? key}) : super(key: key);

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Text(
            "Sign up",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline), hintText: "Full name"),
        ),
        const SizedBox(
          height: 20,
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
        TextFormField(
          controller: _confirmPasswordController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Confirm Password"),
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            if (_passwordController.text == _confirmPasswordController.text) {
              _signUpUser(context,
                  email: _emailController.text,
                  password: _passwordController.text,
                  name: _nameController.text);
            }
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Sign up",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    ));
  }

  void _signUpUser(BuildContext context,
      {required String email,
      required String password,
      required String name}) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      await currentUser.signUpUser(
          email: email, password: password, name: name);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green.shade400,
          content: Row(
            children: const [
              Icon(Icons.check_box_outlined, color: Colors.white),
              SizedBox(
                width: 15,
              ),
              Expanded(child: Text("User created!"))
            ],
          )));
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case "email-already-in-use":
          message = "The email is already in use";
          break;
        case "invalid-email":
          message = "The email is invalid";
          break;
        case "weak-password":
          message = "The password is not strong enough";
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
