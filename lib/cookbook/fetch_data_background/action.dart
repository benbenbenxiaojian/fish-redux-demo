import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum PhotoAction { onLoadData, dataLoaded }

class PhotoActionCreator {
  static Action onLoadData(String url) =>
      Action(PhotoAction.onLoadData, payload: url);

  static Action dataLoaded(PageState pageState) =>
      Action(PhotoAction.dataLoaded, payload: pageState);
}
