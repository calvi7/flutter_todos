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
      height: MediaQuery.of(context).size.height * 0.4,
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
              child: Column(
                children: [
                  AddTodoInput(label: "Title", controller: titleController),
                  AddTodoInput(
                    label: "Description",
                    controller: descriptionController,
                  ),
                  ElevatedButton(
                    onPressed: () => _createTodo(
                      context,
                      titleController.text,
                      descriptionController.text,
                    ),
                    child: const Text("Create Todo"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createTodo(BuildContext context, String title, String description) {
    final isValid = _validateTodo(title, description);

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
      description: description,
    );
    context.read<TodosBloc>().add(TodoAdded(todo));
    Navigator.of(context).pop();
  }

  bool _validateTodo(String title, String description) {
    if (title.isEmpty) {
      return false;
    }
    return true;
  }
}
