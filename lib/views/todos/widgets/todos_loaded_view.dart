import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/views/todos/bloc/todos_bloc.dart';
import 'package:flutter_todos/views/todos/model/todo_model.dart';

class TodosLoadedView extends StatelessWidget {
  const TodosLoadedView({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: todo.description != null ? Text(todo.description!) : null,
          trailing: ElevatedButton(
            onPressed: () => _removeTodo(context, todo),
            child: const Icon(Icons.remove),
          ),
        );
      },
    );
  }

  void _removeTodo(BuildContext context, Todo todo) {
    context.read<TodosBloc>().add(TodoRemoved(todo));
  }
}
