import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum UserStatus {
  addSuccess,
  addFail,
  updateSuccess,
  updateFail,
}

class UserModel with ChangeNotifier {
  final User? _user = FirebaseAuth.instance.currentUser;

  Future<UserStatus> addUser(String name, String phone) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String uid = _user!.uid.toString();
    String email = _user!.email.toString();
    try {
      await users.doc(uid).set({
        'email': email,
        'name': name,
        'phone': phone,
        'uid': uid,
      });
      return UserStatus.addSuccess;
    } catch (e) {
      print(e);
      return UserStatus.addFail;
    }
  }

  Future<UserStatus> updateUser(String email, String name, String phone) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String uid = _user!.uid.toString();
    try {
      await users.doc(uid).set({
        'email': email,
        'name': name,
        'phone': phone,
      });
      await _user!.updateEmail(email);
      return UserStatus.updateSuccess;
    } catch (e) {
      print(e);
      return UserStatus.updateFail;
    }
  }

  /*Future getUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (snapshot) async {
        if (snapshot.exists) {
          setState(() {
            email = snapshot.data()!['email'];
            name = snapshot.data()!['name'];
            phone = snapshot.data()!['phone'];
            snapshot.data()!['uid'];
          });
        }
      },
    );
  }*/
}
