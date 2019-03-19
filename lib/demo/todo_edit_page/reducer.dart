import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TodoEditState> buildReducer() =>
    asReducer(<Object, Reducer<TodoEditState>>{ToDoEditAction.update: _update});

TodoEditState _update(TodoEditState state, Action action) {
  final Map<String, String> update = action.payload ?? <String, String>{};
  return state.clone()
    ..toDo.title = update['name'] ?? state.clone().toDo.title
    ..toDo.desc = update['desc'] ?? state.clone().toDo.desc;
}
