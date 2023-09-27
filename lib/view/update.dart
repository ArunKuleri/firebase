import 'dart:math';
import 'package:firebase/view/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/homepage.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);
  @override
  State<Update> createState() => _Upadte();
}

class _Upadte extends State<Update> {
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController bloodgroup = TextEditingController();
  TextEditingController Division = TextEditingController();
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  void updateUser(docId) {
    final data = {
      'firstname': FirstName.text,
      'last name': LastName.text,
      'bloodgroup': bloodgroup.text,
      'division': Division.text,
      'email': email.text,
      'age': age.text
    };
    user.doc(docId).update(data);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    FirstName.text = args['firstname'];
    LastName.text = args['last name'];
    email.text = args['email'];
    age.text = args['age'];
    bloodgroup.text = args['bloodgroup'];
    Division.text = args['division'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 70,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: FirstName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your first name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: " First Name"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                    controller: LastName,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: " Last Name"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Email Address";
                      }
                      return null;
                    },
                    controller: email,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: " Email Address "),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Age";
                      }
                      return null;
                    },
                    controller: age,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: " Age"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Division";
                      }
                      return null;
                    },
                    controller: Division,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: " Division"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Bloodgroup";
                      }
                      return null;
                    },
                    controller: bloodgroup,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: " Bloodgroup"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    onPressed: () {
                      updateUser(docId);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const profile()));
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    child: const Text(
                      "Update",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
