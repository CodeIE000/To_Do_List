import 'package:flutter/material.dart';

class ListBox extends StatelessWidget {
  const ListBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
