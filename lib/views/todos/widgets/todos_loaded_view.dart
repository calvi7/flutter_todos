import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/views/todos/bloc/todos_bloc.dart';
import 'package:flutter_todos/views/todos/model/todo_model.dart';
import 'package:flutter_todos/views/todos/widgets/todo_card.dart';

class TodosLoadedView extends StatelessWidget {
  const TodosLoadedView({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoCard(todo: todo);
      },
    );
  }
}
