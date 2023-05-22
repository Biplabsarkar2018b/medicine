import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine/constants/appconstants.dart';
import 'package:medicine/constants/loadingpage.dart';
import 'package:medicine/core/provider.dart';
import 'package:medicine/features/auth/controller/auth_controller.dart';
import 'package:medicine/features/auth/view/login_view.dart';
import 'package:medicine/features/auth/widgets/auth_input_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
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
      body: isLoading
          ? const LoadingPage()
          : Center(
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
                          'Sign Up',
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

                      const SizedBox(
                        height: 15,
                      ),
                      // sign in button
                      InkWell(
                        onTap: onSignUp,
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.purple),
                            width: double.infinity,
                            child: const Text(
                              'Sign Up',
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
                            text: 'Already have account?',
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: ' Sign In',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 19),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginView(),
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
