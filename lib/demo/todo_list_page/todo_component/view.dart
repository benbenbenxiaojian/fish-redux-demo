import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ToDoState state, Dispatch dispatch, ViewService viewService) =>
    Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 36,
                  color: state.done ? Colors.green : Colors.red,
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: const Icon(Icons.label_outline),
                        margin: const EdgeInsets.all(8),
                      ),
                      Expanded(
                        child: Text(
                          state.title ?? '',
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: (() => state.done
                              ? const Icon(Icons.check_box)
                              : const Icon(Icons.check_box_outline_blank))(),
                        ),
                        onTap: () {
                          dispatch(
                              ToDoActionCreator.doneAction(state.uniqueId));
                        },
                      ),
                    ],
                  ),
                  alignment: AlignmentDirectional.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                color: const Color(0xffe0e0e0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(
                          state.desc ?? '',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        child: const Icon(Icons.edit),
                      ),
                      onTap: () {
                        dispatch(
                            ToDoActionCreator.onEditAction(state.uniqueId));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          onLongPress: () {
            dispatch(ToDoActionCreator.onRemoveAction(state.uniqueId));
          }),
    );
