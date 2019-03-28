import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:http/http.dart' as http;

import 'action.dart';
import 'state.dart';

Effect<Post> buildEffect() =>
    combineEffects(<Object, Effect<Post>>{FetchAction.onFetch: _onFetch});

void _onFetch(Action action, Context<Post> ctx) {
  _fetchPost().then((post) {
    ctx.dispatch(FetchActionCreator.fetchDataAction(post));
  });
}

Future<Post> _fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
