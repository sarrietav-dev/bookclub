import 'package:bookclub/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future createUser(User user) async {
    await _firestore.collection("users").doc(user.uid).set(user());
  }
}
