import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';
import 'todo_component/component.dart';

Reducer<PageState> buildReducer() => asReducer(<Object, Reducer<PageState>>{
      PageAction.initToDos: _initToDosReducer,
    });

PageState _initToDosReducer(PageState state, Action action) {
  final List<ToDoState> toDos = action.payload ?? <ToDoState>[];
  return state.clone()..toDos = toDos;
}
