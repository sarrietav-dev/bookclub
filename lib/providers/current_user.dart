import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CurrentUser with ChangeNotifier {
  late final String _uid;
  late final String _email;

  String get uid => _uid;
  String get email => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Creates an user in Firebase using [email] and [password].
  ///
  /// Throws an [FirebaseAuthException] if the password was weak and
  /// if the email was invalid or already in use.
  Future<void> signUpUser(
      {required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /// Logs the user in and sets up the data in the provider
  ///
  /// Throws an [FirebaseAuthException] if the [password] was incorrect
  /// the user or the [email] doesn't exist, or if the user was banned.
  Future<void> logInUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    _uid = userCredential.user!.uid;
    _email = userCredential.user!.email!;
  }
}
