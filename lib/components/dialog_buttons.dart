import 'package:flutter/material.dart';
import 'package:todolist_app/theme/colors.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonPressed;
  const Buttons(
      {super.key, required this.buttonText, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: subBackgroundColor,
      onPressed: buttonPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
