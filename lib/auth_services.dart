import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final FirebaseAuth firebaseAuth;

  AuthService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      {String emailData, String passwordData, String usernameData}) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailData, password: passwordData)
          .then((cred) => {
                db.collection('Users').doc(cred.user.uid).set({
                  "username": usernameData,
                  "email": emailData,
                  "password": passwordData,
                })
              });
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
