import 'package:conagora/screens/home_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConAgora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,

              // This will be applied to the "back" icon
              iconTheme: IconThemeData(color: Colors.black),
              // This will be applied to the action icon buttons that locates on the right side
              actionsIconTheme: IconThemeData(color: Colors.amber),
              centerTitle: false,
              elevation: 2,
              titleTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      home: const HomeScreen(),
    );
  }
}
