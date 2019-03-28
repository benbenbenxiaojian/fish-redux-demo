import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Main Screen'),
        ),
        body: GestureDetector(
          child: Hero(
              tag: 'imageHero',
              child: Image.network('https://picsum.photos/250?image=9')),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()));
          },
        ),
      );
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          child: Hero(
              tag: 'imageHero',
              child: Center(
                  child: Image.network('https://picsum.photos/250?image=9'))),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      );
}

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Hero APP',
        home: MainScreen(),
      );
}

void main() => runApp(HeroApp());
