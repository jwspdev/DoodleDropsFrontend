// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthTextField extends TextFormField {
  AuthTextField({
    Key? key,
    bool? obscureText,
    required TextEditingController controller,
  }) : super(
          key: key,
          obscureText: obscureText ?? false,
          controller: controller,
          decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)))),
        );
}
