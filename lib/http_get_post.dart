import 'dart:convert' as convert;

import 'package:flutter_riverpod_practice/model_class.dart';
import 'package:http/http.dart' as http;

class HttpGetPost {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _endUrl = '/posts';
  Future<List<PostsModel>> fetchPosts() async {
    Uri uriPosts = Uri.parse('$_baseUrl$_endUrl');
    http.Response response = await http.get(uriPosts);
    if (response.statusCode == 200) {
      List<dynamic> postsModel = convert.jsonDecode(response.body);
      return postsModel.map((e) => PostsModel.fromJson(e)).toList();
    }
    return [];
  }
}
