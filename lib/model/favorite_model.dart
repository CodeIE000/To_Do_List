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

  // Methods for removing items from cart
  void removeItemsFromFavorites(int index) {
    _favoriteItems.removeAt(index);
    notifyListeners();
  }
}
