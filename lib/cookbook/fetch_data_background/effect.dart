import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'action.dart';
import 'component/state.dart';
import 'state.dart';

Effect<PageState> buildEffect() => combineEffects(
    <Object, Effect<PageState>>{PhotoAction.onLoadData: _onLoadData});

void _onLoadData(Action action, Context<PageState> ctx) {
  final String url = action.payload;
  _fetchPhotos(url).then((photos) =>
      ctx.dispatch(PhotoActionCreator.dataLoaded(PageState(photos: photos))));
}

Future<List<Photo>> _fetchPhotos(String url) async {
  final response = await http.Client().get(url);
  return compute(_parseData, response.body);
}

List<Photo> _parseData(String body) {
  final parsed = json.decode(body).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.formJson(json)).toList();
}
