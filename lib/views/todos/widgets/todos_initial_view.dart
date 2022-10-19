import 'package:flutter/material.dart';

class TodosInitialView extends StatelessWidget {
  const TodosInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: const Text(
          "Parece que no tenes tareas pendientes.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
