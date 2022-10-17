import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/views/todos/widgets/add_todo_widget.dart';
import 'package:flutter_todos/views/todos/widgets/todos_initial_view.dart';
import 'package:flutter_todos/views/todos/widgets/todos_loaded_view.dart';
import 'package:flutter_todos/widgets/loading_widget.dart';

import '../todos.dart';

class TodosView extends StatelessWidget {
  const TodosView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => Scaffold.of(context).showBottomSheet(
              (context) => const AddTodoWidget(),
            ),
          );
        },
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const LoadingWidget();
          } else if (state is TodosLoaded) {
            final todos = state.todos;

            return TodosLoadedView(todos: todos);
          } else {
            return const TodosInitialView();
          }
        },
      ),
    );
  }
}
