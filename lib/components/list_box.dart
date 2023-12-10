import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_app/theme/colors.dart';

class ListBox extends StatefulWidget {
  final bool checkedBox;
  final Function(bool?)? onChanged;
  final String taskName;
  final void Function()? favoritePressed;
  final Function(BuildContext)? deleteTask;
  ListBox(
      {super.key,
      required this.checkedBox,
      required this.onChanged,
      required this.taskName,
      required this.favoritePressed,
      required this.deleteTask});

  @override
  State<ListBox> createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  bool clickedStar = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: widget.deleteTask,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Checkbox
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: textColor,
                    ),
                    child: Checkbox(
                      shape: CircleBorder(),
                      value: widget.checkedBox,
                      onChanged: widget.onChanged,
                      activeColor: objectGreen,
                    ),
                  ),
                  // Task Name
                  Text(
                    widget.taskName,
                    style: TextStyle(
                        color: widget.checkedBox ? objectGreen : textColor,
                        fontWeight: FontWeight.bold,
                        decoration: widget.checkedBox
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
              // Favorite button
              MaterialButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    widget.favoritePressed;
                    setState(() {
                      clickedStar = !clickedStar;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: clickedStar ? Colors.yellow : Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
