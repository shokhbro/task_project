import 'package:flutter/material.dart';
import 'package:task_project/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onToggle;

  const TaskItem({
    required this.task,
    required this.onDelete,
    required this.onEdit,
    required this.onToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) => onToggle(),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
