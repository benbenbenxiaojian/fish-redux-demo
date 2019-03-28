import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: () {
          _showNavigateSelection(context);
        },
        child: const Text('Pick an option,any option!'),
      );

  Future<String> _navigateAndDisplaySelection(BuildContext context) async =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SelectionScreen()));

  void _showNavigateSelection(BuildContext context) {
    _navigateAndDisplaySelection(context).then((result) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
    });
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Pick an option'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Yep!');
                  },
                  child: const Text('Yep!'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nope.');
                  },
                  child: const Text('Nope.'),
                ),
              )
            ],
          ),
        ),
      );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Returning Data Demo'),
        ),
        body: Center(
          child: SelectionButton(),
        ),
      );
}

void main() => runApp(MaterialApp(
      title: 'Returning Data',
      home: HomeScreen(),
    ));
