import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todos/data/repository/todo_repository.dart';
import 'package:flutter_todos/views/todos/model/todo_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc({required TodoRepository repository})
      : _repository = repository,
        super(TodosInitial()) {
    on<TodoAdded>(_addTodo);
    on<TodoRemoved>(_removeTodo);
  }

  final TodoRepository _repository;

  void _addTodo(TodoAdded event, Emitter<TodosState> emit) {
    emit(TodosLoading());
    try {
      _repository.add(event.todo);
      emit(TodosLoaded(_repository.todos));
    } catch (e) {
      emit(TodosError());
    }
  }

  void _removeTodo(TodoRemoved event, Emitter<TodosState> emit) {
    emit(TodosLoading());
    try {
      _repository.remove(event.todo);
      if (_repository.todos.isEmpty) {
        emit(TodosInitial());
      } else {
        emit(TodosLoaded(_repository.todos));
      }
    } catch (e) {
      emit(TodosError());
    }
  }
}
