import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medicine/core/failure.dart';
import 'package:medicine/core/provider.dart';
import 'package:medicine/core/tydefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
    googleSignIn: ref.watch(googleSignInProvider),
  );
});

abstract class IAuthAPI {
  FutureEither<UserCredential> signUp({
    required String email,
    required String password,
  });
  FutureEither<UserCredential> login({
    required String email,
    required String password,
  });
  FutureEither<UserCredential> googleLogin();
}

class AuthAPI implements IAuthAPI {
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  const AuthAPI(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firestore,
      required GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  @override
  FutureEither<UserCredential> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'email': email,
        'password': password,
        //if any more field need to store we will add it here later, eg: name, addresss etc.
      });

      // // storing the uid locally
      // final SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // await sharedPreferences.setString('uid', credential.user!.uid);
      // await sharedPreferences.setString('email', email);

      return right(credential);
    } on FirebaseAuthException catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    } catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    }
  }

  @override
  FutureEither<UserCredential> login(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // storing the uid locally
      // final SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // await sharedPreferences.setString('uid', credential.user!.uid);
      // await sharedPreferences.setString('email', email);

      return right(credential);
    } on FirebaseAuthException catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    } catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    }
  }

  @override
  FutureEither<UserCredential> googleLogin() async {
    try {
      // Obtain the GoogleSignInAccount
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      // Obtain the GoogleSignInAuthentication
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      // Create a credential using the GoogleAuthProvider
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'password': 'Signed In With Google',
        //if any more field need to store we will add it here later, eg: name, addresss etc.
      });

      // storing the uid locally
      // final SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // await sharedPreferences.setString('uid', userCredential.user!.uid);
      // await sharedPreferences.setString('email', userCredential.user!.email!);


      return right(userCredential);
    } on FirebaseAuthException catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    } catch (e, st) {
      return left(
        Failure(e.toString(), st),
      );
    }
  }
}
