import 'package:flutter/material.dart';
import 'package:kpr_todo_app/Screens/add_edit_task.dart';
import 'package:kpr_todo_app/components/card.dart';
import 'package:kpr_todo_app/constants/data.dart';
import 'package:kpr_todo_app/constants/theme.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  void deleteTask(int id) {
    setState(() {
      tasksList.removeWhere((e) => e["id"] == id);
    });
  }

  void addEditTask(int id, String title, String subTitle) {
    setState(() {
      var existingTaskIndex = tasksList.indexWhere((task) => task['id'] == id);
      if (existingTaskIndex != -1) {
        tasksList[existingTaskIndex]['title'] = title;
        tasksList[existingTaskIndex]['subtitle'] = subTitle;
      } else {
        tasksList.add({
          "id": id,
          "title": title,
          "subtitle": subTitle,
          "completed": false
        });
      }
    });
  }

  void completeTask(int id) {
    Map<String, dynamic> editTask =
        tasksList.firstWhere((task) => task['id'] == id);
    setState(() {
      editTask["completed"] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> todolist =
        tasksList.where((e) => e['completed'] == false).toList();

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kBgColor,
        title: const Text(
          "TODO APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: kStrokeColor,
              height: 2,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskCard(
                title: todolist[index]['title'],
                subTitle: todolist[index]['subtitle'],
                id: todolist[index]['id'],
                deleteTask: deleteTask,
                completeTask: completeTask,
                addEditTask: addEditTask
                );
          },
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddEditTask(id: -1, addEditTask: addEditTask,)));
          },
          icon: Container(
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                "assets/icons/plus.png",
              ))),
    );
  }
}
