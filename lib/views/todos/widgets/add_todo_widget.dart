import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/views/todos/bloc/todos_bloc.dart';
import 'package:flutter_todos/views/todos/model/todo_model.dart';
import 'package:flutter_todos/widgets/add_todo_input.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: AddTodoInput(
                label: "Agregar una tarea",
                controller: titleController,
                onSend: () => _createTodo(context, titleController.text),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createTodo(BuildContext context, String title) {
    final isValid = _validateTodo(title);

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 10,
          backgroundColor: Colors.red,
          content: Text(
            "Not a valid Todo.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    final Todo todo = Todo(
      title: title,
      completed: false,
      created: DateTime.now(),
    );
    context.read<TodosBloc>().add(TodoAdded(todo));
    Navigator.of(context).pop();
  }

  bool _validateTodo(String title) {
    if (title.isEmpty) {
      return false;
    }
    return true;
  }
}
