import 'package:class_6/screens/nextscreen/nextscreen.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Class 6"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: const [
                CircleAvatar(
                  radius: 55,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Your Name"),
              ],
            )),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NextScreen()));
              },
              tileColor: Colors.blueGrey,
              leading: const Icon(Icons.home),
              title: const Text("NextScreen"),
              subtitle: const Text("Go to NextScreen"),
              trailing: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.amber,
              ),
            ],
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.green,
          //     ),
          //     const Text("data")
          //   ],
          // ),
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Stack(
              alignment: Alignment.center,
              children: const [
                Icon(
                  Icons.access_alarm,
                  size: 50,
                  color: Colors.white,
                ),
                Positioned(bottom: 10, child: Text("data"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
