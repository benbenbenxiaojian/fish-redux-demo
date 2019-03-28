import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
  dispatch(PhotoActionCreator.onLoadData(
      'https://jsonplaceholder.typicode.com/photos'));
  return Scaffold(
    appBar: AppBar(
      title: const Text('Fetch Data in Background'),
    ),
    body: Center(
      child: (state != null && state.photos != null)
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: viewService.buildAdapter().itemBuilder,
              itemCount: viewService.buildAdapter().itemCount,
            )
          : const CircularProgressIndicator(),
    ),
  );
}
