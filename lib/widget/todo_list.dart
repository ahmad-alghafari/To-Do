import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widget/todo.dart';
import '../list_provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlanIt value, Widget? child) {
        if (value.notes.isEmpty) {
          return const Center(
            child: Text(
              "Empty Notes.",
              style: TextStyle(color: Colors.black45, fontSize: 50),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: value.notes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ToDo(
                index: index,
                id: value.notes[index]['ID'],
              );
            },
          );
        }
      },
    );
  }
}
