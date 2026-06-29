import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
}

class AuthServicesImp implements AuthServices {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<bool> login(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> register(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
