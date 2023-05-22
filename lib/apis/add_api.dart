import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicine/core/failure.dart';
import 'package:medicine/core/provider.dart';
import 'package:medicine/core/tydefs.dart';

final addAPIProvider = Provider((ref) {
  return AddAPI(
    firestore: ref.watch(firestoreProvider),
    user: ref.watch(currUserProvider),
  );
});

abstract class IAddApi {
  FutureEither<void> addMedicin({
    required String compartment,
    required String color,
    required String type,
    required String quantity,
    required String totalCount,
  });
}

class AddAPI implements IAddApi {
  final User _user;
  final FirebaseFirestore _firestore;
  const AddAPI({required FirebaseFirestore firestore, required User user})
      : _firestore = firestore,
        _user = user;
  @override
  FutureEither<void> addMedicin(
      {required String compartment,
      required String color,
      required String type,
      required String quantity,
      required String totalCount}) async {
    try {
      await _firestore.collection('medicine').doc(_user.uid).set({
        'compartment': compartment,
        'color': color,
        'type': type,
        'quantity': quantity,
        'totalCount': totalCount,
      });
      return right(null);
    } on FirebaseException catch (e, st) {
      return left(Failure(e.toString(), st));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
