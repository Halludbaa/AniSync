import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';

class AuthServices {
  Future<User?> signup({
    required String email,
    required String password,
  }) async {
    try {
      print("test: $email $password");
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = credential.user!;

      return user;
    } on FirebaseAuthException catch (e) {
      String message = '';

      switch (e.code) {
        case 'weak-password':
          message = "The password provided is too weak";
        case 'email-already-in-use':
          message = "An account already exists with that email.";
      }
      print(e);
      Get.snackbar("Error", message);
      return null;
    }
  }

  Future<User?> signin({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      return user;
    } on FirebaseAuthException catch (e) {
      String message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'No user found for that email.';
        case 'invalid-credential':
          message = 'Wrong password provided for that user.';
      }
      Get.snackbar("Error", message);
    }
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();

    await Future.delayed(const Duration(seconds: 1));
  }
}
