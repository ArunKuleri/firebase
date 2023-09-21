// ignore_for_file: use_build_context_synchronously

import 'dart:js';

import 'package:firebase/model/firebaseFunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Auth {
  static signupUser(
      String email,
      String password,
      String division,
      String Bloodgroup,
      String firstName,
      String lastName,
      int age,
      BuildContext) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.updateEmail(email);
      }
      await FireStoreServices.saverUser(firstName, lastName, email, division,
          Bloodgroup, age, userCredential.user!.uid);
      ScaffoldMessenger.of(BuildContext)
          .showSnackBar(SnackBar(content: Text("Registration Sucessful")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(BuildContext)
            .showSnackBar(SnackBar(content: Text("Password is too weak")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(BuildContext).showSnackBar(
            SnackBar(content: Text("Email provided already exists")));
      }
    } catch (e) {
      ScaffoldMessenger.of(BuildContext)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signInUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("You are Logged in")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'usr-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No user Found with this email")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("password did not match")));
      }
    }
  }
}
