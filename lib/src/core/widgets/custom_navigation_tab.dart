import 'package:doodle_drops/src/core/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomNavigationTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CustomNavigationTab(
      {super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    // const baseFontSize = 11.0;
    return SizedBox(
      height: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    "$title",
                    textAlign: TextAlign.center,
                    style: openSansMedium(
                        color: isSelected ? Colors.cyan : Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              height: 3,
              color: isSelected ? Colors.cyan : Colors.transparent,
            ),
          ]),
    );
  }
}
