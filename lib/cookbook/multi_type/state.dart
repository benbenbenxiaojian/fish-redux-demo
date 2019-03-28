import 'package:fish_redux/fish_redux.dart';

abstract class ListItem {}

class HeaderState extends Cloneable<HeaderState> implements ListItem {
  @override
  HeaderState clone() => null;
}
