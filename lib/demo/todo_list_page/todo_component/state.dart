import 'package:fish_redux/fish_redux.dart';

class ToDoState implements Cloneable<ToDoState> {
  ToDoState({this.uniqueId, this.title, this.done = false, this.desc}) {
    uniqueId ??= DateTime.now().toIso8601String();
  }

  String uniqueId;
  String title;
  String desc;
  bool done;

  @override
  ToDoState clone() => ToDoState()
    ..title = title
    ..desc = desc
    ..done = done
    ..uniqueId = uniqueId;

  @override
  String toString() =>
      'ToDoState{uniqueId: $uniqueId, title: $title, desc: $desc, done: $done}';
}
