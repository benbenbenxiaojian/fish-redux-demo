import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../todo_component/component.dart';
import 'reducer.dart';

class ToDoListAdapter extends DynamicFlowAdapter<PageState> {
  ToDoListAdapter()
      : super(pool: <String, Component<Object>>{
          'toDo': ToDoComponent(),
        }, reducer: buildReducer(), connector: _ToDoListConnector());
}

class _ToDoListConnector implements Connector<PageState, List<ItemBean>> {
  @override
  List<ItemBean> get(PageState state) {
    if (state.toDos?.isNotEmpty == true) {
      return state.toDos
          .map<ItemBean>((data) => ItemBean('toDo', data))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(PageState state, List<ItemBean> substate) {
    if (substate?.isNotEmpty == true) {
      state.toDos = List<ToDoState>.from(
          substate.map<ToDoState>((bean) => bean.data).toList());
    } else {
      state.toDos = <ToDoState>[];
    }
  }
}
