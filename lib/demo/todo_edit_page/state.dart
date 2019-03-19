import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../todo_list_page/todo_component/component.dart';

class TodoEditState implements Cloneable<TodoEditState> {
  ToDoState toDo;

  TextEditingController nameEditController;
  TextEditingController descEditController;

  FocusNode focusNodeName;
  FocusNode focusNodeDesc;

  @override
  TodoEditState clone() => TodoEditState()
    ..nameEditController = nameEditController
    ..descEditController = descEditController
    ..focusNodeName = focusNodeName
    ..focusNodeDesc = focusNodeDesc
    ..toDo = toDo;
}

TodoEditState initState(ToDoState arg) => TodoEditState()
  ..toDo = arg?.clone() ?? ToDoState()
  ..nameEditController = TextEditingController(text: arg?.title)
  ..descEditController = TextEditingController(text: arg?.desc)
  ..focusNodeName = FocusNode()
  ..focusNodeDesc = FocusNode();
