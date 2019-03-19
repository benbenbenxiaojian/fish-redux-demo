import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ToDoState> buildReducer() => asReducer(<Object, Reducer<ToDoState>>{
      ToDoAction.edit: _edit,
      ToDoAction.done: _done,
    });

ToDoState _edit(ToDoState state, Action action) {
  final ToDoState toDo = action.payload;
  if (state.uniqueId == toDo.uniqueId) {
    return state.clone()
      ..title = toDo.title
      ..desc = toDo.desc;
  }
  return state;
}

ToDoState _done(ToDoState state, Action action) {
  final String uniqueId = action.payload;
  if (state.uniqueId == uniqueId) {
    return state.clone()..done = !state.done;
  }
  return state;
}
