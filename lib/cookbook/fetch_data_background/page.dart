import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FetchBackgroundPage extends Page<PageState, Map<PageState, dynamic>> {
  FetchBackgroundPage()
      : super(
            initState: initSate,
            view: buildView,
            effect: buildEffect(),
            reducer: buildReducer(),
            dependencies: Dependencies<PageState>(
              adapter: PhotoListAdapter(),
            ));
}
