import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  static saverUser(String firstname, String lastname, String email,
      String division, String bloodgroup, int age, String uid) async {
    await FirebaseFirestore.instance.collection("user").doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      "bloodgroup": bloodgroup,
      'division': division,
      'age': age,
    });
  }

  static updateUser(String uid, Map<String, dynamic> updatedUserData) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(updatedUserData);
  }

  static deleteUser(String uid) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).delete();
  }
}
