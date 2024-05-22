import 'package:flutter/material.dart';
import 'package:task_project/models/task_model.dart';

class TasksController extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void updateTask(int index, String title) {
    _tasks[index].title = title;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  int get completedTaskCount {
    return _tasks.where((task) => task.isCompleted).length;
  }

  int get uncompletedTaskCount {
    return _tasks.where((task) => !task.isCompleted).length;
  }
}
