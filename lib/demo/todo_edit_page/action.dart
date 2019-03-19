import 'package:fish_redux/fish_redux.dart';

enum ToDoEditAction { update, onDone }

class ToDoEditActionCreator {
  static Action update(String name, String desc) =>
      Action(ToDoEditAction.update,
          payload: <String, String>{'name': name, 'desc': desc});

  static Action done() => const Action(ToDoEditAction.onDone);
}
