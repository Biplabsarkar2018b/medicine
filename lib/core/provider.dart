import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});

final googleSignInProvider = Provider((ref) => GoogleSignIn());

// final uidExistProvider = Provider((ref) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final uid = prefs.getString('uid');
//   return uid != null;
// });

final currUserProvider = Provider<User>((ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  return user!;
});
