import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/views/todos/widgets/add_todo_widget.dart';
import 'package:flutter_todos/views/todos/widgets/fab_builder.dart';
import 'package:flutter_todos/views/todos/widgets/todos_appbar.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const FabBuilder(),
      body: CustomScrollView(
        slivers: [
          const TodosAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _blocBuilder(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _blocBuilder(BuildContext context) =>
      BlocBuilder<TodosBloc, TodosState>(
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
      );
}
