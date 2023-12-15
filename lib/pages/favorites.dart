import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/components/list_box.dart';
import 'package:todolist_app/model/favorite_model.dart';
import 'package:todolist_app/pages/finished_tasks.dart';
import 'package:todolist_app/pages/home.dart';
import 'package:todolist_app/theme/colors.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  FavoriteModel fm = FavoriteModel();

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
                    builder: (context) => const Home(),
                  ),
                ),
                icon: const Icon(
                  Icons.home,
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
            "  Favorites",
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
                    itemCount: value.favoriteItems.length,
                    itemBuilder: (context, index) {
                      return ListBox(
                        checkedBox: value.favoriteItems[index][0],
                        taskName: value.favoriteItems[index][1],
                        onChanged: (value) => fm.checkboxClicked(value, index),
                        favoritePressed: () {
                          Provider.of<FavoriteModel>(context, listen: false)
                              .addItemsToFavorites(index);
                        },
                        deleteTask: (context) => fm.deleteTask(index),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
