import 'package:flutter/material.dart';

class TaskAddEditDialog extends StatefulWidget {
  final String? initialTitle;
  final bool isEditing;

  const TaskAddEditDialog({
    this.initialTitle,
    this.isEditing = false,
    super.key,
  });

  @override
  State<TaskAddEditDialog> createState() => _TaskAddEditDialogState();
}

class _TaskAddEditDialogState extends State<TaskAddEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.initialTitle ?? "";
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEditing ? 'Rejani tahrirlash' : 'Reja qo\'shish'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          initialValue: title,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelText: 'Reja',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Iltimos reja kiriting';
            }
            return null;
          },
          onSaved: (newValue) {
            title = newValue ?? "";
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Bekor qilish'),
        ),
        ElevatedButton(
          onPressed: _save,
          child: const Text('Saqlash'),
        ),
      ],
    );
  }
}
