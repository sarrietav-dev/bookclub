import 'package:bookclub/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookclub/utils/typedefs.dart';

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future createUser(User user) async {
    await _firestore.collection("users").doc(user.uid).set(user());
  }

  static Future<User> getUser(String uid) async {
    DocumentSnapshot<Json> snapshot =
        await _firestore.collection("users").doc(uid).get();

    return User(
        uid: snapshot.id,
        email: snapshot.get("email"),
        name: snapshot.get("name"),
        accountCreated: snapshot.get("accountCreated"));
  }
}
