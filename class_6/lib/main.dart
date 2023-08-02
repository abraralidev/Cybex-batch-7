import 'package:class_6/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Class 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        // useMaterial3: true
      ),
      // theme: ThemeData.dark(
      //   useMaterial3: true
      // ),
      home: const Home(),
    );
  }
}


// counter app
// stack
// Position
// Drawer