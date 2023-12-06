import 'package:flutter/material.dart';
import 'package:todolist_app/theme/colors.dart';
import 'package:todolist_app/utilities/dialog_buttons.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final VoidCallback pressedSave;
  final VoidCallback pressedCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.pressedSave,
      required this.pressedCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        padding: const EdgeInsets.all(1),
        height: 130,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Textfield Container
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: controller,
                maxLength: 30,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: subBackgroundColor,
                  hintText: "Type a task...",
                  hintStyle: TextStyle(color: textColor),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: subBackgroundColor)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: subBackgroundColor),
                  ),
                ),
              ),
            ),
            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Save button
                Buttons(
                  buttonText: "Save",
                  buttonPressed: pressedSave,
                ),
                // Cancel button
                Buttons(
                  buttonText: "Cancel",
                  buttonPressed: pressedCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
