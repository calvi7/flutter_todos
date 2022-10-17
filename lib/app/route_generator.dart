import 'package:flutter/cupertino.dart';
import 'package:flutter_todos/views/error/error.dart';
import 'package:flutter_todos/views/todos/todos.dart';

class AnimatedRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case TodosPage.route:
        page = const TodosPage();
        break;
      default:
        page = const ErrorPage();
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: settings,
    );
  }
}
