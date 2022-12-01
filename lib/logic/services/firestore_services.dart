import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static void saveData() {
    FirebaseFirestore.instance.collection("users").doc("user2").set({
      "name": "Himanshu2",
      "email": "himanshusharma2@gmail.com",
      "phoneNumber": "2377466133",
    }, SetOptions(merge: true));
  }

  static void fetchData() async {
    // QuerySnapshot snapshot =
    //     await FirebaseFirestore.instance.collection("users").get();
    // log(snapshot.docs[1].id.toString());

    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").doc("user1").get();
    log(snapshot.data.toString());
  }

  static void updateData() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc("user1")
        .update({"name": "Himansh"});
  }

  static void deleteData() async {
    FirebaseFirestore.instance.collection("users").doc("user1").delete();
  }
}
