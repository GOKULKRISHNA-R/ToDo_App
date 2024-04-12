import 'package:flutter/material.dart';
import 'package:kpr_todo_app/constants/data.dart';
import 'package:kpr_todo_app/constants/theme.dart';

class AddEditTask extends StatefulWidget {
  const AddEditTask({super.key, required this.id, required this.addEditTask });

  final void Function(int id, String title, String subTitle) addEditTask ;
  final int id;

  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {

  @override
  Widget build(BuildContext context) {
    bool isAdd = (widget.id == -1);
    Map<String, dynamic> editTask = isAdd
        ? {
            'title': '',
            'subtitle': '',
          }
        : tasksList.firstWhere((task) => task['id'] == widget.id);

    TextEditingController titleController = TextEditingController();
    TextEditingController subTitleController = TextEditingController();
    titleController.text = editTask['title'];
    subTitleController.text = editTask['subtitle'];

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/Turn BackPage Button.png",
            height: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: false,
        backgroundColor: kBgColor,
        title: Text(
          isAdd ? "Add Task" : "Edit Task",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: kStrokeColor,
              height: 2,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: titleController,
            decoration: const InputDecoration(
              hintText: "Title",
              fillColor: Colors.white,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: subTitleController,
            decoration: const InputDecoration(
              hintText: "Sub-Title",
              fillColor: Colors.white,
              hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 51,
          ),
          isAdd
              ? ElevatedButton(
                  onPressed: () {
                    widget.addEditTask(tasksList.length + 1, titleController.text,
                        subTitleController.text);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(369, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "ADD",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          widget.addEditTask(widget.id, titleController.text,
                              subTitleController.text);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: kPrimaryColor,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "UPDATE",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: kPrimaryColor,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "CANCEL",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ))
                  ],
                )
        ]),
      ),
    );
  }
}
