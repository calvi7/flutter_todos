part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodoAdded extends TodosEvent {
  final Todo todo;

  const TodoAdded(this.todo);
}

class TodoRemoved extends TodosEvent {
  final Todo todo;

  const TodoRemoved(this.todo);
}
