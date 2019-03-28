import 'package:flutter/material.dart';

class ScreenArguments {
  ScreenArguments(this.title, this.message);

  final String title;
  final String message;
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const String routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen(
      {@required this.title, @required this.message, Key key})
      : super(key: key);

  static const String routeName = '/passArguments';

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: const Text('navigate to screen that extracts arguments'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExtractArgumentsScreen(),
                          settings: RouteSettings(
                              arguments: ScreenArguments(
                                  'Extract Arguments Screen',
                                  'This message is extracted in '))));
                },
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PassArgumentsScreen.routeName,
                      arguments: ScreenArguments('Accept Argument Screen',
                          'This message is extracted in the onGenerateRoute function'));
                },
                child: const Text('Navigate to a named that accepts arguments'),
              )
            ],
          ),
        ),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Navigation with Arguments',
        home: HomeScreen(),
        onGenerateRoute: (settings) {
          if (settings.name == PassArgumentsScreen.routeName) {
            final ScreenArguments args = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => PassArgumentsScreen(
                    title: args.title, message: args.message));
          }
        },
      );
}

void main() => runApp(MyApp());
