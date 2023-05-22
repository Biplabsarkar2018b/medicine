import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/apis/auth_api.dart';
import 'package:medicine/features/home/view/home_view.dart';

import '../../../constants/uiconstants.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    state = false;
    res.fold((l) => showSnackBar(context, l.error), (r) {
      showSnackBar(context, 'Account Created! ');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authAPI.login(
      email: email,
      password: password,
    );
    state = false;
    res.fold((l) => showSnackBar(context, l.error), (r) {
      showSnackBar(context, 'Logged IN! Welcome');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });
  }

  void signInWithGoogle({required BuildContext context}) async {
    state = true;
    final res = await _authAPI.googleLogin();
    state = false;
    res.fold((l) => showSnackBar(context, l.error), (r) {
      
      showSnackBar(context, 'Logged IN! Welcome');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });
  }
}
