import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}