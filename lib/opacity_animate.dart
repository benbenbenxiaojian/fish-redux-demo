import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final _appTitle = 'Opacity Demo';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: _appTitle,
        home: MyHomePage(title: _appTitle),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({@required this.title, Key key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          tooltip: 'Toggle Opacity',
          child: const Icon(Icons.flip),
        ),
      );
}
