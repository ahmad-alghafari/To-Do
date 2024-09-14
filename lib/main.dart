import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todolist/views/home_page.dart';
import 'package:todolist/views/splash_screen.dart';

import 'list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlanIt(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        initialRoute: Splash.name,
        routes: {
          Splash.name: (context) => const Splash(),
          HomePage.name: (context) => const HomePage()
        },

        home: const HomePage(),
        // home: const Splash(),
      ),
    );
  }
}
