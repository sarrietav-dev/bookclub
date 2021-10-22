import 'package:bookclub/models/user.dart' as model;
import 'package:bookclub/providers/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser with ChangeNotifier {
  model.User? _firestoreUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isAuth {
    User? currentUser = _auth.currentUser;

    if (currentUser == null) return false;

    _firestoreUser?.uid = currentUser.uid;
    _firestoreUser?.email = currentUser.email!;
    return true;
  }

  /// Creates an user in Firebase using [email] and [password].
  ///
  /// Throws an [FirebaseAuthException] if the password was weak and
  /// if the email was invalid or already in use.
  Future<void> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await Database.createUser(model.User(
        name: name,
        email: email,
        uid: userCredential.user!.uid,
        accountCreated: Timestamp.now()));
  }

  /// Logs the user in and sets up the data in the provider
  ///
  /// Throws an [FirebaseAuthException] if the [password] was incorrect
  /// the user or the [email] doesn't exist, or if the user was banned.
  Future<void> logInUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    _firestoreUser?.uid = userCredential.user!.uid;
    _firestoreUser?.email = userCredential.user!.email!;
  }

  Future<void> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount == null) return;

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(authCredential);

    if (userCredential.additionalUserInfo!.isNewUser) {
      Database.createUser(model.User(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: userCredential.user!.displayName ?? "Unknown",
          accountCreated: Timestamp.now()));
    }

    _firestoreUser?.uid = userCredential.user!.uid;
    _firestoreUser?.email = userCredential.user!.email!;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _firestoreUser = null;
  }
}
