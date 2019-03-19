import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum FetchAction { fetchData, onFetch }

class FetchActionCreator {
  static Action fetchData(Future<Post> post) =>
      Action(FetchAction.fetchData, payload: post);
}
