import 'package:flutter/material.dart';
import 'package:flutter_todos/app/app.dart';
import 'package:flutter_todos/data/repository/todo_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  final todoRepository = TodoRepository();

  runApp(App(repository: todoRepository));
}
