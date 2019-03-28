import 'package:fish_redux/fish_redux.dart';

import 'component/state.dart';

class PageState implements Cloneable<PageState> {
  PageState({this.photos});

  List<Photo> photos;

  @override
  PageState clone() => PageState()..photos = photos;
}

PageState initSate(Map<PageState, dynamic> args) => PageState();
