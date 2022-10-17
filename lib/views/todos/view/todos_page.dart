import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/data/repository/todo_repository.dart';

import '../todos.dart';
import 'todos_view.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({
    Key? key,
  }) : super(key: key);

  static const String route = 'todos';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosBloc>(
      create: (context) => TodosBloc(
        repository: RepositoryProvider.of<TodoRepository>(context),
      ),
      child: const TodosView(),
    );
  }
}
