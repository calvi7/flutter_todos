import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/constants/text_styling.dart';
import 'package:flutter_todos/views/todos/bloc/todos_bloc.dart';
import 'package:flutter_todos/views/todos/model/todo_model.dart';
import 'package:flutter_todos/widgets/list_item_selector.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TodosBloc>();
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: ListTile(
              leading: ListItemSelector(
                isSelected: todo.completed,
                onTap: () => todo.completed
                    ? bloc.add(TodoUncompleted(todo))
                    : bloc.add(TodoCompleted(todo)),
                radius: 40,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                todo.title,
                style: TextStyling.todoCardTitle,
              ),
              subtitle: const Text(
                "Tareas",
                style: TextStyling.todosCardSubtitle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
