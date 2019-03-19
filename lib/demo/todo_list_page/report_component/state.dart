import 'package:fish_redux/fish_redux.dart';

class ReportState implements Cloneable<ReportState> {
  ReportState({this.total, this.done});

  int total;
  int done;

  @override
  ReportState clone() => ReportState()
    ..total = total
    ..done = done;

  @override
  String toString() => 'ReportState{total: $total, done: $done}';
}
