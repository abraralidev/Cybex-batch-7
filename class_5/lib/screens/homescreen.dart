import 'package:class_5/screens/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class 5"),
      ),
      body: Column(
        children: [
          // ========================= Expanded Row 1 ===================================
          Expanded(
              child: Row(
            children: [
              // ========================= Expanded Box 1 ===================================
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
              )),
              // ========================= Expanded Box 2 ===================================
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
              )),
            ],
          )),
          // ========================= Expanded Row 2 ===================================
          Expanded(
              child: Row(
            children: [
              // ========================= Expanded Box 1 ===================================
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
              )),
            ],
          )),
          // ========================= Expanded Row 3 ===================================
          Expanded(
              child: Row(
            children: [
              // ========================= Expanded Box 1 ===================================
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
              )),
              // ========================= Expanded Box 2 ===================================
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
              )),
            ],
          )),
          InkWell(
            hoverColor: Colors.red,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5),
              height: 60,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  "Calculator",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
