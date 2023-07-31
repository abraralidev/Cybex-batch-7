// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textlist = [
      'Person 1',
      'Person 2',
      'Person 3',
      'Person 4',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'ListView',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                child: ListTile(
                  // tileColor: Colors.black12,
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'),
                  ),
                  title: Text('Person $index'),
                  subtitle: const Text('Message'),
                  trailing: const Text('12:25 AM'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
