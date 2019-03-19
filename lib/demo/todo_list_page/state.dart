import 'package:fish_redux/fish_redux.dart';

import 'report_component/component.dart';
import 'todo_component/component.dart';

class PageState implements Cloneable<PageState> {
  List<ToDoState> toDos;

  @override
  PageState clone() => PageState()..toDos = toDos;

  @override
  String toString() => 'PageState{toDos: $toDos}';
}

PageState initState(Map<String, dynamic> args) => PageState();

class ReportConnector extends ConnOp<PageState, ReportState> {
  @override
  ReportState get(PageState state) => ReportState()
    ..total = state.toDos.length
    ..done = state.toDos.where((tds) => tds.done).toList().length;

  @override
  void set(PageState state, ReportState substate) {}
}
