import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/model/favorite_model.dart';
import 'package:todolist_app/pages/favorites.dart';
import 'package:todolist_app/pages/finished_tasks.dart';
import 'package:todolist_app/theme/colors.dart';
import 'package:todolist_app/components/dialog_box.dart';
import 'package:todolist_app/components/list_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controller for Dialog Box Textfield
  FavoriteModel fm = FavoriteModel();
  final _controller = TextEditingController();

  // Method for dialog box
  void openDialogBox() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
          controller: _controller,
          pressedSave: saveToDoList,
          pressedCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          }),
    );
  }

  // Method for saving To-Do List
  void saveToDoList() {
    setState(() {
      fm.todolist.add([false, _controller.text]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  // Method for checking checkbox
  void checkboxClicked(bool? value, int index) {
    setState(() {
      fm.todolist[index][0] = !fm.todolist[index][0];
      fm.favoriteItems[index][0] = !fm.favoriteItems[index][0];
    });
  }

  // Method for deleting task
  void deleteTask(int index) {
    setState(() {
      fm.todolist.removeAt(index);
      fm.favoriteItems.removeAt(index);
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FinishedTasks(),
                  ),
                ),
                icon: const Icon(
                  Icons.check_box,
                ),
              ),
              const Text(
                "To-Do List",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w900),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Favorites(),
                  ),
                ),
                icon: const Icon(
                  Icons.star,
                ),
              ),
            ],
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            "  Tasks",
            style: TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  color: subBackgroundColor,
                  borderRadius: BorderRadius.circular(20)),
              height: 455,
              padding: const EdgeInsets.all(10),
              child: Consumer<FavoriteModel>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.todolist.length,
                  itemBuilder: (context, index) => ListBox(
                    checkedBox: value.todolist[index][0],
                    taskName: value.todolist[index][1],
                    onChanged: (value) => checkboxClicked(value, index),
                    favoritePressed: () {
                      Provider.of<FavoriteModel>(context, listen: false)
                          .addItemsToFavorites(index);
                    },
                    deleteTask: (context) => deleteTask(index),
                  ),
                ),
              ),
            ),
          ),
        ],
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
