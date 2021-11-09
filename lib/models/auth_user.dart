import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  bool? loginStatus = false;
  String? error;

  Future<bool> loginWithEmailPass(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // ignore: avoid_print
      print(userCredential);
      loginStatus = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        error = 'Wrong password provided for that user.';
      }
    }
    return false;
  }

  Future<bool> signUpWithEmailPass(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // ignore: avoid_print
      print(userCredential);
      loginStatus = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        error = 'The account already exists for that email.';
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }

    return false;
  }
}
