import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FetchPage extends Page<Post, Map<Post, dynamic>> {
  FetchPage()
      : super(
            initState: initState,
            view: buildView,
            effect: buildEffect(),
            reducer: buildReducer());
}
