import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================== AppBar Section =====================================
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Class No 2'),
        // leading: const Icon(Icons.menu),
        // centerTitle: true,
        // actions: const [
        //   Icon(Icons.abc_outlined),
        // ],
      ),
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      // ========================== Main Body Of screen Section =====================================
      // Step 1: We will use Column Widget to add multiple widgets in a single screen
      body: Center(
        child: Column(
          // Step 2: We will use mainAxisAlignment to align widgets in a column
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ========================== Here we call a container =====================================
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.all(10),
              color: Colors.red,
              child: const Center(child: Text('Hello World')),
            ),
            // ========================== Here we call a container =====================================
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text('Hello World')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
