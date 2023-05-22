import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine/features/auth/view/login_view.dart';
import 'package:medicine/features/auth/view/signup_view.dart';

import 'firebase_options.dart';

// import 'firebase_options.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const ProviderScope(child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpView(),
    );
  }
}



