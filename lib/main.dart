import 'package:flutter/material.dart';
import 'package:kpr_todo_app/Screens/completed_task.dart';
import 'package:kpr_todo_app/Screens/to_do.dart';
import 'package:kpr_todo_app/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    TodoScreen(),
    CompletedTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "jost"),
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "All"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: "Completed")
          ],
          backgroundColor: kBgColor,
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kUnSelectedColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
