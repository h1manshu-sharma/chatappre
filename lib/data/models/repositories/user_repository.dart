import 'package:cloud_firestore/cloud_firestore.dart';

import '../user_model.dart';

class UserRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel userModel) async {
    _firestore
        .collection("users")
        .doc(userModel.id)
        .set(userModel.toJson(), SetOptions(merge: true));
  }

  Future<UserModel?> fetchUserById(String uid) async {
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(uid).get();

    if (snapshot.exists) {
      Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
      return UserModel.fromJson(map);
    } else {
      return null;
    }
  }

  Future<void> saveUser(UserModel userModel) async {
    _firestore
        .collection("users")
        .doc(userModel.id)
        .set(userModel.toJson(), SetOptions(merge: true));
  }
}
