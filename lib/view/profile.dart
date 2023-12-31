import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/update.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  User? userId = FirebaseAuth.instance.currentUser;
  String? currentUserUid;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  void deleteUser(docId) {
    users.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
        stream: users.where('uid', isEqualTo: currentUserUid).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot usersSnap = snapshot.data.docs[index];

                  return Container(
                    height: 80,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 30,
                              child: Text(
                                usersSnap['division'],
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              usersSnap['firstname'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              usersSnap['last name'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(usersSnap['email']),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/update',
                                      arguments: {
                                        'firstname': usersSnap['firstname'],
                                        'last name': usersSnap['last name'],
                                        'age': usersSnap['age'].toString(),
                                        'bloodgroup': usersSnap['Bloodgroup'],
                                        'email': usersSnap['email'],
                                        'division': usersSnap['division'],
                                        'id': usersSnap.id,
                                      });
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  deleteUser(usersSnap.id);
                                },
                                icon: const Icon(Icons.delete_outline_sharp))
                          ],
                        )
                      ],
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
