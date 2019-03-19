import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

enum ToDoAction { onEdit, edit, done, onRemove, remove }

class ToDoActionCreator {
  //Effect
  static Action onEditAction(String uniqueId) =>
      Action(ToDoAction.onEdit, payload: uniqueId);

  //Reducer
  static Action editAction(ToDoState toDo) =>
      Action(ToDoAction.edit, payload: toDo);

  //Reducer
  static Action doneAction(String uniqueId) =>
      Action(ToDoAction.done, payload: uniqueId);

  //Effect
  static Action onRemoveAction(String uniqueId) =>
      Action(ToDoAction.onRemove, payload: uniqueId);

  //Reducer
  static Action removeAction(String uniqueId) =>
      Action(ToDoAction.remove, payload: uniqueId);
}
