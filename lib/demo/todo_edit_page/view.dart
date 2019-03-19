import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
        TodoEditState stae, Dispatch dispatch, ViewService viewService) =>
    Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Text(
                      'title:',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    width: 56,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xffe0e0e0),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 8),
                      child: EditableText(
                          controller: stae.nameEditController,
                          focusNode: stae.focusNodeName,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          cursorColor: Colors.yellow,
                          autofocus: true,
                          backgroundCursorColor: const Color(0xfffff590)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 32),
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: const Text(
                        'desc:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      width: 56,
                      alignment: AlignmentDirectional.topEnd,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xffe0e0e0),
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(left: 8),
                        child: EditableText(
                            controller: stae.descEditController,
                            focusNode: stae.focusNodeDesc,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            cursorColor: Colors.yellow,
                            maxLines: 10,
                            backgroundCursorColor: const Color(0xffe0e0e0)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => dispatch(ToDoEditActionCreator.done()),
        tooltip: 'Done',
        child: const Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
