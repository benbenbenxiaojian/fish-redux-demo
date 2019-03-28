import 'package:flutter/material.dart';

import 'page.dart';
import 'state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Fetch Data in Background',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FetchBackgroundPage().buildPage(<PageState, dynamic>{}),
      );
}

void main() => runApp(MyApp());
