import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../todo_edit_page/page.dart' as edit_page;
import 'action.dart';
import 'list_adapter/action.dart' as list_action;
import 'state.dart';
import 'todo_component/component.dart';

Effect<PageState> buildEffect() => combineEffects(<Object, Effect<PageState>>{
      Lifecycle.initState: _init,
      PageAction.onAdd: _onAdd,
    });

void _init(Action action, Context<PageState> ctx) {
  ctx.dispatch(PageActionCreator.initToDosAction(<ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello World',
      desc: 'Learn how to grogram',
      done: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application',
      done: false,
    )
  ]));
}

void _onAdd(Action action, Context<PageState> ctx) {
  Navigator.of(ctx.context)
      .push<ToDoState>(MaterialPageRoute<ToDoState>(
          builder: (buildContext) => edit_page.ToDoEditPage().buildPage(null)))
      .then((toDo) {
    if (toDo != null &&
        (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
      ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
    }
  });
}
