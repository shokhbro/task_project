import 'package:flutter/material.dart';
import 'package:task_project/controllers/task_controller.dart';

class TaskReport extends StatelessWidget {
  final TasksController controller;

  const TaskReport({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bajarilgan rejalar: ${controller.completedTaskCount}'),
            const SizedBox(height: 8),
            Text('Bajarilmagan rejalar: ${controller.uncompletedTaskCount}'),
          ],
        ),
      ),
    );
  }
}
