// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name;
  int? age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name ?? ''),
            Text('${age ?? 0}'),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  prefs.setString('name', 'Flutter App Class 10');
                  prefs.setInt('age', 21);
                  name = prefs.getString('name');
                  age = prefs.getInt('age');
                  setState(() {});
                  print(name);
                },
                child: const Text("Store Data")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('name');
                  prefs.remove('age');
                  name = null;
                  age = null;
                  setState(() {});
                },
                child: const Text("remove Data"))
          ],
        ),
      ),
    );
  }
}
