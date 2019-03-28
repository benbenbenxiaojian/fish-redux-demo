import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<Post> buildReducer() =>
    asReducer(<Object, Reducer<Post>>{FetchAction.fetchData: _fetch});

Post _fetch(Post post, Action action) {
  final Post newPost = action.payload;
  return post.clone()
    ..body = newPost.body
    ..title = newPost.title
    ..id = newPost.id
    ..userId = newPost.userId;
}
