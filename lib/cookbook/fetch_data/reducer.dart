import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:http/http.dart' as http;

import 'action.dart';
import 'state.dart';

Reducer<Future<Post>> buildReducer() =>
    asReducer(<Object, Reducer<Future<Post>>>{
      FetchAction.fetchData: _fetchData,
    });

Future<Post> _fetchData(Future<Post> post, Action action) => _fetchPost();

Future<Post> _fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
