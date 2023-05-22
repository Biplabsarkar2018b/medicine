import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final bool isHidden;
  const AuthInputField(
      {super.key,
      required this.icon,
      required this.hint,
      this.isHidden = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          hintText: hint),
    );
  }
}
