import 'package:flutter/material.dart';
import 'package:task_project/controllers/task_controller.dart';
import 'package:task_project/views/widgets/task_report.dart';
import '../widgets/task_add_edit.dart';
import '../widgets/task_item.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TasksController tasksController = TasksController();

  void _addOrEditTask({int? index}) async {
    String? initialTitle;
    bool isEditing = false;

    if (index != null) {
      initialTitle = tasksController.tasks[index].title;
      isEditing = true;
    }

    final title = await showDialog<String>(
      context: context,
      builder: (context) {
        return TaskAddEditDialog(
          initialTitle: initialTitle,
          isEditing: isEditing,
        );
      },
    );

    if (title != null) {
      setState(() {
        if (isEditing) {
          tasksController.updateTask(index!, title);
        } else {
          tasksController.addTask(title);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rejalar'),
        actions: [
          IconButton(
            onPressed: () => _addOrEditTask(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          TaskReport(controller: tasksController),
          Expanded(
            child: ListView.builder(
              itemCount: tasksController.tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  task: tasksController.tasks[index],
                  onDelete: () {
                    setState(() {
                      tasksController.deleteTask(index);
                    });
                  },
                  onEdit: () => _addOrEditTask(index: index),
                  onToggle: () {
                    setState(() {
                      tasksController.toggleTaskCompletion(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
