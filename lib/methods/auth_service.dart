import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper.dart';

class AuthService {
  final FirebaseAuth user = FirebaseAuth.instance;
  //Login
  registerUser(String email, String password) async {
    try {
      await user.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  String? getCurrentUserId() {
    return user.currentUser!.email;
  }

  //Login User
  loginUser(String email, String password) async {
    try {
      await user.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  logOut() async {
    await HelperFunctions().saveUserLoggedInStatus(false);
    user.signOut();
  }
}
