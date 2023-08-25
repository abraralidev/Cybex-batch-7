// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Auth/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todos = FirebaseFirestore.instance.collection('users');
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _taskupdateController = TextEditingController();
  final 
   _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
          stream: todos.doc(_auth.currentUser!.uid).collection('cart').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onLongPress: () {
                            // ================================== Update Function ===========================================
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Update Task'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: _taskupdateController,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter your task here'),
                                        )
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () async {
                                            await todos
                                                .doc(snapshot
                                                    .data.docs[index].id)
                                                .update({
                                              'date':
                                                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                              'name': _nameController.text,
                                              'image': _imageController.text,
                                              'price': _priceController.text
                                            });

                                            Navigator.pop(context);
                                          },
                                          child: const Text('Update'))
                                    ],
                                  );
                                });
                          },
                          // ================================== Read Function ===========================================

                          leading:
                              Image.network(snapshot.data.docs[index]['image']),
                          title: Text(snapshot.data.docs[index]['name']),
                          subtitle:
                              Text('\$ ${snapshot.data.docs[index]['price']}'),
                          trailing: IconButton(
                              onPressed: () {
                                // ================================== delete Function ===========================================

                                todos
                                    .doc(snapshot.data.docs[index].id)
                                    .delete();
                              },
                              icon: const Icon(Icons.close)),
                        ),
                      );
                    })
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ================================== Add task Function ===========================================
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Task'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Enter your name here'),
                      ),
                      TextFormField(
                        controller: _imageController,
                        decoration: const InputDecoration(
                            hintText: 'Enter your image here'),
                      ),
                      TextFormField(
                        controller: _priceController,
                        decoration: const InputDecoration(
                            hintText: 'Enter your price here'),
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          await todos.add({
                            'date':
                                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                            'name': _nameController.text,
                            'image': _imageController.text,
                            'price': _priceController.text
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
