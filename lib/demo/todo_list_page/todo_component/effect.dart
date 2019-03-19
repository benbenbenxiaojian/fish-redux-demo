import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../todo_edit_page/page.dart' as eidt_page;
import 'action.dart';
import 'state.dart';

Effect<ToDoState> buildEffect() => combineEffects(<Object, Effect<ToDoState>>{
      ToDoAction.onEdit: _onEdit,
      ToDoAction.onRemove: _onRemove,
    });

void _onEdit(Action action, Context<ToDoState> ctx) {
  if (action.payload == ctx.state.uniqueId) {
    Navigator.of(ctx.context)
        .push<ToDoState>(MaterialPageRoute<ToDoState>(
            builder: (buildContext) =>
                eidt_page.ToDoEditPage().buildPage(ctx.state)))
        .then((toDo) {
      if (toDo != null) {
        ctx.dispatch(ToDoActionCreator.editAction(toDo));
      }
    });
  }
}

// ignore: avoid_void_async
void _onRemove(Action action, Context<ToDoState> ctx) async {
  // ignore: omit_local_variable_types
  final String select = await showDialog(
      context: ctx.context,
      builder: (buildContexgt) => AlertDialog(
            title: Text('Are you sure to delete ${ctx.state.title}?'),
            actions: <Widget>[
              GestureDetector(
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => Navigator.of(buildContexgt).pop(),
              ),
              GestureDetector(
                child: const Text(
                  'Yes',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => Navigator.of(buildContexgt).pop('Yes'),
              )
            ],
          ));
  if (select == 'Yes') {
    ctx.dispatch(ToDoActionCreator.removeAction(ctx.state.uniqueId));
  }
}
