import 'package:flutter/material.dart';

class TodosInitialView extends StatelessWidget {
  const TodosInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: const Text(
          "It seems there are no Todos loaded. Maybe try adding one?",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
