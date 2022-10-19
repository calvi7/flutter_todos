import 'package:flutter/material.dart';
import 'package:flutter_todos/views/todos/widgets/add_todo_widget.dart';

class FabBuilder extends StatelessWidget {
  const FabBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return FloatingActionButton.extended(
          label: Row(
            children: const [
              Icon(Icons.add),
              Text("Agregar una tarea"),
            ],
          ),
          onPressed: () => Scaffold.of(context).showBottomSheet(
            (context) => const AddTodoWidget(),
          ),
        );
      },
    );
  }
}
