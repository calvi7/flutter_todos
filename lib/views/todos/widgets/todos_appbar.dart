import 'package:flutter/material.dart';
import 'package:flutter_todos/utils/datetime.dart';

class TodosAppbar extends StatelessWidget {
  const TodosAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTimeHelper.currentDate();

    return const SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: Text("Mi dia"),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      expandedHeight: 100,
      pinned: true,
    );
  }
}
