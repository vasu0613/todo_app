import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:todo/data/databse.dart';
import 'package:todo/widgets/dialog_box.dart';
import 'package:todo/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _taskController.text,
        false,
        _detailController.text,
        _dateController.text,
      ]);
      _taskController.clear();
      _detailController.clear();
      _dateController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          taskController: _taskController,
          detailController: _detailController,
          dateController: _dateController,
          onAdd: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void removeTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surfaceTint,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: db.toDoList.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientText(
                    'T R A C K O R Y',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 40),
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Theme.of(context).colorScheme.onTertiary,
                      Theme.of(context).colorScheme.tertiaryFixed,
                    ],
                    textAlign: TextAlign.center,
                  ),
                  Lottie.asset('assets/lottie/Checklist.json'),
                ],
              )
            : SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 1,
                      child: GradientText(
                        'T R A C K O R Y',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        colors: [
                          Theme.of(context).colorScheme.onTertiary,
                          Theme.of(context).colorScheme.tertiaryFixed,
                        ],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 13,
                      child: ListView.builder(
                        itemCount: db.toDoList.length,
                        itemBuilder: (context, index) {
                          return TodoTile(
                            taskName: db.toDoList[index][0],
                            taskCompleted: db.toDoList[index][1],
                            taskDetail: db.toDoList[index][2],
                            dateTime: db.toDoList[index][3],
                            onChanged: (value) => checkBoxChanged(value, index),
                            deleteTask: (context) => removeTask(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createNewTask,
        backgroundColor: Theme.of(context).colorScheme.primary,
        icon: Icon(Icons.add, color: Theme.of(context).colorScheme.tertiary),
        label: Text(
          'Add Task',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ),
    );
  }
}
