import 'package:flutter/material.dart';
import 'package:todolist_app/theme/colors.dart';
import 'package:todolist_app/utilities/list_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List for To-Do List content
  List listContent = [
    ["Hello World", false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "To-Do List",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listContent.length,
        itemBuilder: (context, index) => ListBox(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: objectGreen,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
