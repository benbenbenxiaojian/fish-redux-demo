import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum FetchAction { onFetch, fetchData }

class FetchActionCreator {
  static Action onFetchAction(Post post) =>
      Action(FetchAction.onFetch, payload: post);

  static Action fetchDataAction(Post post) =>
      Action(FetchAction.fetchData, payload: post);
}
