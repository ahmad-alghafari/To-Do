import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../list_provider.dart';

class ToDo extends StatelessWidget {
  int index;
  int id;
  ToDo({super.key, required this.index, required this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlanIt value, Widget? child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 260,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${value.notes[index]['TODO']}",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          decoration: value.notes[index]['DONE'] == 1
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    value.done(index, id);
                  },
                  icon: Icon(
                    Icons.check,
                    size: 30,
                    color: value.notes[index]["DONE"] == 0
                        ? Colors.white
                        : Colors.blueAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    value.delete(index, id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
