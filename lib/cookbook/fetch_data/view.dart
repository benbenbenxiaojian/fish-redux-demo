import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(Post state, Dispatch dispatch, ViewService viewService) {
  dispatch(FetchActionCreator.onFetchAction(state));
  return Scaffold(
      appBar: AppBar(
        title: const Text('fetch_data_from_internet'),
      ),
      body: Center(
          child: (state.title != null)
              ? Text(state.title)
              : const CircularProgressIndicator()));
}
