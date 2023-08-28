// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartproducts = FirebaseFirestore.instance.collection('users');
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _taskupdateController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: StreamBuilder(
          stream: cartproducts
              .doc(_auth.currentUser!.uid)
              .collection('cart')
              .snapshots(),
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
                                            await cartproducts
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

                                cartproducts
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
    );
  }
}
