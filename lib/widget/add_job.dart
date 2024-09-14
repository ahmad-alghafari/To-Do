import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/list_provider.dart';

class AddJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? job;
    return Container(
      // color: Colors.white,
      height: 600,
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              job = value;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black, fontSize: 30),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              if (job != null && job != "") {
                context.read<PlanIt>().addJob(job!);
              }
              Navigator.pop(context);
            },
            child: const Text(
              "Add",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
