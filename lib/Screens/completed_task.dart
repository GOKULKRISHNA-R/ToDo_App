import 'package:flutter/material.dart';
import 'package:kpr_todo_app/components/completed_card.dart';
import 'package:kpr_todo_app/constants/data.dart';
import 'package:kpr_todo_app/constants/theme.dart';

class CompletedTaskScreen extends StatefulWidget {
  CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  List<Map<String, dynamic>> todolist =
      tasksList.where((e) => e['completed'] == true).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kBgColor,
        title: const Text(
          "Completed Tasks",
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
            return CompletedCard(
                title: todolist[index]['title'],
                subTitle: todolist[index]['subtitle']);
          },
        ),
      ),
    );
  }
}
