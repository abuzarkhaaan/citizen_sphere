import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "view model/usermodel.dart";

UserModel? userData;

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static var userCollection = FirebaseFirestore.instance.collection('Users');

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> registerUser(UserModel userDataModel) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: userDataModel.email!, password: userDataModel.password!);
      userDataModel.userId = currentUser!.uid;
      await userCollection.doc(currentUser!.uid).set(userDataModel.toJSON());
      await getUser();
      return "Sucess";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> getUser() async {
    try {
      final snapshot =
          await userCollection.doc(_firebaseAuth.currentUser!.uid).get();
      print("hoooooo" + snapshot.toString());

      userData = UserModel.fromJSON(snapshot.data()!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> sighInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
