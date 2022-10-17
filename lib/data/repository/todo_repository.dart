import 'package:flutter_todos/views/todos/model/todo_model.dart';

class TodoRepository {
  final List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  final List<Todo> _completed = [];
  List<Todo> get completed => _completed;

  final List<Todo> _initialList = [
    const Todo(title: "Limpiar el cuarto"),
    const Todo(
      title: "Arreglar la casa",
      description: "Arreglar la heladera",
    ),
    const Todo(title: "Bañar al perro", completed: true),
  ];

  List<Todo> get initialList => _initialList;

  void add(Todo todo) {
    _todos.add(todo);
  }

  void complete(Todo todo) {
    remove(todo);
    final completed = todo.copyWith(completed: true);
    _completed.add(completed);
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }

  void clearAll() {
    _todos.removeWhere((element) => true);
  }
}
