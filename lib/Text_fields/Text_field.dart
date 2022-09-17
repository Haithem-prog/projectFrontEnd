import 'package:book_store/utilz/theme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.controller, this.isSecure = false}) : super(key: key);

  final bool isSecure;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Material(
        child: TextField(
          style: const TextStyle(
            color: AppTheme.textblack,
            fontWeight: FontWeight.bold,
          ),
          controller: controller,
          obscureText: isSecure,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(),
        ),
      ),
    );
  }
}
