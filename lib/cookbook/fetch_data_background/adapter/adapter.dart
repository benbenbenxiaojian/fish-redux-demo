import 'package:fish_redux/fish_redux.dart';

import '../component/component.dart';
import '../component/state.dart';
import '../state.dart';

class PhotoListAdapter extends DynamicFlowAdapter<PageState> {
  PhotoListAdapter()
      : super(
            connector: _PhotoListConnector(),
            pool: <String, Component<Object>>{'photos': PhotoComponent()});
}

class _PhotoListConnector implements Connector<PageState, List<ItemBean>> {
  @override
  List<ItemBean> get(PageState state) {
    if (state.photos?.isNotEmpty == true) {
      return state.photos
          .map((photo) => ItemBean('photos', photo))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(PageState state, List<ItemBean> substate) {
    if (state.photos?.isNotEmpty == true) {
      state.photos =
          List<Photo>.from(substate.map<Photo>((item) => item.data).toList());
    } else {
      state.photos = <Photo>[];
    }
  }
}
