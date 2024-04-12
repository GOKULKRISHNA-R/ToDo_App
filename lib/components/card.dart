import 'package:flutter/material.dart';
import 'package:kpr_todo_app/Screens/add_edit_task.dart';
import 'package:kpr_todo_app/constants/data.dart';
import 'package:kpr_todo_app/constants/theme.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.id,
    required this.deleteTask,
    required this.completeTask,
    required this.addEditTask,
  });

  final String title;
  final String subTitle;
  final int id;
  final void Function(int id) deleteTask;
  final void Function(int id) completeTask;
  final void Function(int id, String title, String subTitle) addEditTask;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      decoration: const BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.clip),
              ),
              Text(
                widget.subTitle,
                softWrap: true,
                style: const TextStyle(
                    color: kSubTitleColor,
                    fontSize: 11,
                    overflow: TextOverflow.clip),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddEditTask(id: widget.id, addEditTask: widget.addEditTask)));
                  },
                  icon: Image.asset("assets/icons/Pencil.png")),
              IconButton(
                  onPressed: () {
                    widget.deleteTask(widget.id);
                  },
                  icon: Image.asset("assets/icons/Trash.png")),
              IconButton(
                  onPressed: () {
                    widget.completeTask(widget.id);
                  },
                  icon: Image.asset("assets/icons/CheckCircle.png")),
            ],
          )
        ],
      ),
    );
  }
}
