import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Class No 3'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const Icon(Icons.settings)
          ],
          // leading: const Icon(Icons.abc),
        ),
        drawer: const Drawer(),
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: const Center(child: Text("Box No 1")),
            ),
//============================= Network Image ===============================================

            Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Image.network(
                    'https://images.unsplash.com/photo-1690139217228-df437e22cf21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=327&q=80',
                    fit: BoxFit.cover)),
//============================= Asset Image ===============================================
// Step 1: Create a folder named assets in the root directory of the project
// Step 2: Download Image from https://unsplash.com/
// Step 3: open pubspec.yaml file
// Step 4: line 62, 63 uncomment and add the following code
// assets:
//   - assets/
// Step 5: Call asset image in
            Row(
              children: [
                const Text(
                  "Box No 1",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: Image.asset('assets/image1.jpg', fit: BoxFit.cover),
                ),
              ],
            ),
// ========================== Row =======================================
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: const Center(child: Text("Box No 1")),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: const Center(child: Text("Box No 2")),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Button')),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
