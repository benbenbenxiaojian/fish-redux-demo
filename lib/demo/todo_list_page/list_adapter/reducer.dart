import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../todo_component/action.dart' as todo_action;
import '../todo_component/component.dart';
import 'action.dart';

Reducer<PageState> buildReducer() => asReducer(<Object, Reducer<PageState>>{
      ToDoListAction.add: _add,
      todo_action.ToDoAction.remove: _remove
    });

PageState _add(PageState state, Action action) {
  final ToDoState toDo = action.payload;
  return state.clone()..toDos.add(toDo);
}

PageState _remove(PageState state, Action action) {
  final String unique = action.payload;
  return state.clone()..toDos.removeWhere((tds) => tds.uniqueId == unique);
}
