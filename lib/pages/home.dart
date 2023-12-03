import 'package:flutter/material.dart';
import 'package:todolist_app/theme/colors.dart';
import 'package:todolist_app/utilities/dialog_box.dart';
import 'package:todolist_app/utilities/list_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controller for Dialog Box Textfield
  final _controller = TextEditingController();

  // List for To-Do List content
  List listContent = [
    [false, "Hello world"]
  ];

  // Method for dialog box
  void openDialogBox() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        pressedSave: saveToDoList,
        pressedCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  // Method for saving To-Do List
  void saveToDoList() {
    setState(() {
      listContent.add([false, _controller.text]);
      Navigator.of(context).pop();
    });
  }

  // Method for checking checkbox
  void checkboxClicked(bool? value, int index) {
    setState(() {
      listContent[index][0] = !listContent[index][0];
    });
  }

  // Method for deleting task
  void deleteTask(int index) {
    setState(() {
      listContent.removeAt(index);
    });
  }

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
        itemBuilder: (context, index) => ListBox(
          checkedBox: listContent[index][0],
          taskName: listContent[index][1],
          onChanged: (value) => checkboxClicked(value, index),
          deleteTask: (context) => deleteTask(index),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => openDialogBox(),
        backgroundColor: objectGreen,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
