import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(
  ReportState state,
  Dispatch dispatch,
  ViewService viewService,
) =>
    Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      color: Colors.blue,
      child: Row(
        children: <Widget>[
          Container(
            child: const Icon(Icons.report),
            margin: const EdgeInsets.only(right: 8),
          ),
          Text(
            'Total ${state.total} task, ${state.done} done.',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
