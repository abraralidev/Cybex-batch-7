// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/postmodel.dart';

class ApiService {
  Future<List<PostModel>?> getpost() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PostModel> Model = postModelFromJson(response.body);
        return Model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
