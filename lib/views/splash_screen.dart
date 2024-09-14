import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todolist/list_provider.dart';
import 'package:todolist/views/home_page.dart';
import 'package:provider/provider.dart';
import '../list_provider.dart';

class Splash extends StatefulWidget {
  static const String name = "splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, HomePage.name);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ChangeNotifierProvider(
      //         create: (context) => PlanIt(),
      //         builder: (context, child) => const HomePage(),
      //       ),
      //     ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Text(
                "PlanIt",
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
