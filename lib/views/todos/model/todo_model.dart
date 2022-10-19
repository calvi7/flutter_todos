import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.title,
    this.completed = false,
    this.description,
    required this.created,
  });

  final String title;
  final String? description;
  final bool completed;
  final DateTime created;

  Todo copyWith({
    String? title,
    String? description,
    bool? completed,
    DateTime? created,
  }) =>
      Todo(
        title: title ?? this.title,
        description: description,
        completed: completed ?? this.completed,
        created: created ?? this.created,
      );

  @override
  List<Object> get props => [title, completed];
}
