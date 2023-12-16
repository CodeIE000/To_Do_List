import 'package:flutter/material.dart';
import 'package:todolist_app/theme/colors.dart';

class FinishedTasks extends StatefulWidget {
  const FinishedTasks({super.key});

  @override
  State<FinishedTasks> createState() => _FinishedTasksState();
}

class _FinishedTasksState extends State<FinishedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Finished Tasks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "  Waiting For\nFuture Update!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
