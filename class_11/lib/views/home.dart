// ignore_for_file: avoid_print

import 'package:class_11/models/postmodel.dart';
import 'package:class_11/services/apiservice.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Postmodel>? postModel = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      postModel = (await ApiService().getpost());
      Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {}));
    } catch (e) {
      print(e); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Get Api')),
      body: postModel!.isEmpty || postModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postModel!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(postModel![index].title!),
                  subtitle: Text(postModel![index].body!),
                );
              }),
    );
  }
}
