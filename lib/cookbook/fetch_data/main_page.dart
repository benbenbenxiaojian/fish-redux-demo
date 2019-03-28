import 'package:flutter/material.dart';

import 'page.dart';
import 'state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: FetchPage().buildPage(<Post, dynamic>{}),
      );
}

void main() => runApp(MyApp());
