import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.title,
    this.completed = false,
    this.description,
  });

  final String title;
  final String? description;
  final bool completed;

  Todo copyWith({
    String? title,
    String? description,
    bool? completed,
  }) =>
      Todo(
        title: title ?? this.title,
        description: description,
        completed: completed ?? this.completed,
      );

  @override
  List<Object> get props => [title, completed];
}
