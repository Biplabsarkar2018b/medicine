import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine/constants/appconstants.dart';
import 'package:medicine/constants/loadingpage.dart';
import 'package:medicine/features/auth/view/signup_view.dart';
import 'package:medicine/features/auth/widgets/auth_input_field.dart';

import '../controller/auth_controller.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void login() {
    ref.read(authControllerProvider.notifier).login(
          email: _email.text,
          password: _password.text,
          context: context,
        );
  }

  void onGoogleSignIN() {
    ref
        .read(authControllerProvider.notifier)
        .signInWithGoogle(context: context);
  }
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine'),
      ),
      body: isLoading ? const LoadingPage() : Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppConstants.appLogo,
                  color: Colors.amber,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
                // Sign In text

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 45),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // input field
                AuthInputField(
                  icon: Icons.email,
                  hint: 'Email',
                  controller: _email,
                ),
                const SizedBox(
                  height: 25,
                ),
                // input field
                AuthInputField(
                  icon: Icons.lock,
                  hint: 'Password',
                  isHidden: true,
                  controller: _password,
                ),
                const SizedBox(
                  height: 15,
                ),
                // forget pass

                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'forgot password ?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                // sign in button
                InkWell(
                  onTap: login,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.purple),
                      width: double.infinity,
                      child: const Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                // or
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                // continue with google
                InkWell(
                  onTap: onGoogleSignIN,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppConstants.google_icon,
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          'Coninue With Google',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // new to...sign up
                RichText(
                  text: TextSpan(
                      text: 'New to Medicine?',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: ' Sign Up',
                            style: const TextStyle(color: Colors.blue, fontSize: 19),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpView(),
                                  ),
                                );
                            })
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
