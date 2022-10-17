import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/app/route_generator.dart';
import 'package:flutter_todos/data/repository/todo_repository.dart';
import 'package:flutter_todos/views/todos/todos.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.repository,
  });

  final TodoRepository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        initialRoute: TodosPage.route,
        onGenerateRoute: AnimatedRouter.onGenerateRoute,
      ),
    );
  }
}
