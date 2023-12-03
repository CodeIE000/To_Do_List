import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListBox extends StatefulWidget {
  final bool checkedBox;
  final Function(bool?)? onChanged;
  final String taskName;
  final Function(BuildContext)? deleteTask;
  ListBox(
      {super.key,
      required this.checkedBox,
      required this.onChanged,
      required this.taskName,
      required this.deleteTask});

  @override
  State<ListBox> createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: widget.checkedBox,
                onChanged: widget.onChanged,
                activeColor: Colors.black,
              ),
              Text(
                widget.taskName,
                style: TextStyle(
                    decoration: widget.checkedBox
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              // Task Name
            ],
          ),
        ),
      ),
    );
  }
}
