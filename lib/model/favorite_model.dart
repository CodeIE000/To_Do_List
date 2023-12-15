import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  final _controller = TextEditingController();
  final List _todolist = [
    [false, "Hello World"],
  ];

  final List _favoriteItems = [];

  get todolist => _todolist;

  get favoriteItems => _favoriteItems;

  // Methods for adding items to cart
  void addItemsToFavorites(int index) {
    favoriteItems.add(todolist[index][0][1]);
    notifyListeners();
  }

  // Method for removing items from cart
  void removeItemsFromFavorites(int index) {
    favoriteItems.removeAt(index);
    notifyListeners();
  }

  // Method for checking checkbox
  void checkboxClicked(bool? value, int index) {
    todolist[index][0] = !todolist[index][0];
    notifyListeners();
  }

  // Method for saving To-Do List
  void saveToDoList() {
    todolist.add([false, _controller.text]);
    _controller.clear();
    notifyListeners();
  }

  // Method for deleting task
  void deleteTask(int index) {
    todolist.removeAt(index);
    favoriteItems.removeAt(index);
    notifyListeners();
  }
}
