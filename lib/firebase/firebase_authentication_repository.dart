import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<void> registerUser(String email, String password);
  Future<void> signInUser(String email, String password);
}

class FirebaseAuthentication implements AuthenticationRepository {
  @override
  Future<void> registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      throw Exception();
    }
  }

  @override
  Future<void> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      throw Exception();
    }
  }
}
