import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  CustomTextField({
    Key? key,
    TextStyle? style,
    TextInputType? type,
  }) : super(
            key: key,
            style: style,
            keyboardType: type,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))));
}
