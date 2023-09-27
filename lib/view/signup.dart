import 'dart:math';
import 'package:firebase/view/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/view/homepage.dart';
import 'package:flutter/material.dart';
import '../model/authFunction.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');
  void addUsers() {
    final data = {
      'firstname': FirstName.text,
      'age': age.text,
      'Bloodgroup': bloodgroup.text,
      'division': Division.text,
      'last name': LastName.text,
      'email': email.text,
    };
    user.add(data);
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController bloodgroup = TextEditingController();
  TextEditingController Division = TextEditingController();
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              const Text(
                " Create your Account here !!",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Padding(
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 8 ||
                          !value.contains(RegExp(r'/d')) ||
                          !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
                        return null;
                    },
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "  Password"),
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
                      if (value != password) {
                        return "enter correct password";
                      }
                    },
                    controller: ConfirmPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: " Confirm  Password"),
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
                      addUsers();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const profile()));
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member ? "),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    child: const Text("Login here ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
