import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AuthServices {
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds: 1));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
      // );

      Get.offAllNamed(AppRouteNamed.home);
    } on FirebaseAuthException catch (e) {
      String message = '';

      switch (e.code) {
        case 'weak-password':
          message = "The password provided is too weak";
        case 'email-already-in-use':
          message = "An account already exists with that email.";
      }
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds: 1));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
      // );
      Get.offAllNamed(AppRouteNamed.home);
    } on FirebaseAuthException catch (e) {
      String message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'No user found for that email.';
        case 'invalid-credential':
          message = 'Wrong password provided for that user.';
      }
    }
  }

  Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(AppRouteNamed.login);
  }
}
