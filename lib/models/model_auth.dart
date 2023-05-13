import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  signupSuccess,
  signupFail,
  loginSuccess,
  loginFail,
}

class AuthModel with ChangeNotifier {
  final FirebaseAuth _auth;
  User? _user;

  AuthModel({auth}) : _auth = auth ?? FirebaseAuth.instance;

  Future<AuthStatus> signupWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthStatus.signupSuccess;
    } catch (e) {
      print(e);
      return AuthStatus.signupFail;
    }
  }

  Future<AuthStatus> loginWithEmail(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        _user = credential.user;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        prefs.setString('email', email);
        prefs.setString('password', password);
      });
      print("[+] 로그인유저 : ${_user!.email}");
      return AuthStatus.loginSuccess;
    } catch (e) {
      print(e);
      return AuthStatus.loginFail;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    prefs.setString('email', '');
    prefs.setString('password', '');
    _user = null;
    await _auth.signOut();
    print("[-] 로그아웃");
  }
}
