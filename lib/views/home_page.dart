import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/list_provider.dart';

import '../widget/add_job.dart';
import '../widget/todo_list.dart';

class HomePage extends StatelessWidget {
  static const String name = "homepage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        key: key,
        child: SafeArea(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<PlanIt>().deleteAll();
                },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      child: const Icon(
                        Icons.delete,
                        size: 40,
                      ),
                    ),
                    const Text(
                      "Delete All Notes.",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ToDo",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (context) => AddJob());
              },
              icon: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer(
                  builder: (BuildContext context, PlanIt value, Widget? child) {
                    return const TodoList();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
