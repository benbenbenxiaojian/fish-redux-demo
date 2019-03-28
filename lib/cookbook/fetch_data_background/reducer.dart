import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PageState> buildReducer() => asReducer(
    <Object, Reducer<PageState>>{PhotoAction.dataLoaded: _dataLoaded});

PageState _dataLoaded(PageState state, Action action) {
  final PageState newState = action.payload;
  return state.clone()..photos = newState.photos;
}
