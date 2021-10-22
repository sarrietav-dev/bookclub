import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents an User in the Firestore database.
class User {
  String uid;
  String email;
  String name;
  Timestamp accountCreated;

  User(
      {required this.uid,
      required this.email,
      required this.name,
      required this.accountCreated});
}
