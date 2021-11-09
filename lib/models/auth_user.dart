import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  bool? loginStatus = false;
  String? error;

  Future<bool> signUpWithEmailPass() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
      // ignore: avoid_print
      print(userCredential);
      loginStatus = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }

    return false;
  }
}
