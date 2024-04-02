import 'package:flutter/material.dart';

class HorizontalContainer extends StatelessWidget {
  final Widget anyWidget;
  const HorizontalContainer({super.key, required this.anyWidget});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Colors.grey.shade300,
        child: SizedBox(
          height: 50,
          child: anyWidget,
        ),
      ),
    );
  }
}
