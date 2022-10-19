import 'package:flutter/material.dart';

class AddTodoInput extends StatelessWidget {
  const AddTodoInput({
    super.key,
    required this.label,
    required this.controller,
    required this.onSend,
  });

  final String label;
  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextFormField(
        autofocus: true,
        onFieldSubmitted: (String _) => onSend(),
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
        ),
      ),
    );
  }
}
