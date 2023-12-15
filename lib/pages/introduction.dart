import 'package:flutter/material.dart';
import 'package:todolist_app/pages/home.dart';
import 'package:todolist_app/theme/colors.dart';

// ignore: must_be_immutable
class Introduction extends StatefulWidget {
  void Function()? onTap;
  Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "To-Do List",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  color: objectGreen, borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Be Productive!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      )),
    );
  }
}
