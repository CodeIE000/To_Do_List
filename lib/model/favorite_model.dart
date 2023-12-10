import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  final List _todolist = [
    [false, "Hello World"],
  ];

  List _favoriteItems = [];

  get todolist => _todolist;

  get favoriteItems => _favoriteItems;

  // Methods for adding items to cart
  void addItemsToFavorites(int index) {
    _favoriteItems.add(_todolist[index]);
    notifyListeners();
  }

  // Method for removing items from cart
  void removeItemsFromFavorites(int index) {
    _favoriteItems.removeAt(index);
    notifyListeners();
  }

  // Method for checking checkbox
  void checkboxClicked(bool? value, int index) {
    _todolist[index][0] = !_todolist[index][0];
  }
}
