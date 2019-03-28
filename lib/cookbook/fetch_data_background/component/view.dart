import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(Photo photo, Dispatch dispatch, ViewService viewService) =>
    Image.network(photo.thumbnailUrl);
