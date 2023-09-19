// ignore_for_file: avoid_print, unused_local_variable

import 'package:class_11/models/postmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Postmodel>?> getpost() async {
    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts#');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final postmodel = postmodelFromJson(response.body);
        return postmodel;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
