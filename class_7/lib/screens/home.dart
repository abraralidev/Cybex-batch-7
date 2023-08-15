import 'package:appiclass/models/postmodel.dart';
import 'package:flutter/material.dart';

import '../service/apiservice.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<PostModel>? postModel = [];

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    postModel = await ApiService().getpost();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Api Class 1'),
        ),
        body: postModel == null || postModel!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: postModel!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(postModel![index].id.toString()),
                    ),
                    title: Text(postModel![index].title!),
                    subtitle: Text(postModel![index].body!),
                  );
                },
              ));
  }
}
