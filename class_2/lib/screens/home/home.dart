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
                child: Image.network('https://images.unsplash.com/photo-1689890076926-afb4add0bc86?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
