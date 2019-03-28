import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: const [
                  Tab(
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bike),
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bus),
                  )
                ]),
                title: const Text('Tab Bar'),
              ),
              body: TabBarView(children: const [
                Icon(Icons.directions_car),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bus)
              ]),
            )),
      );
}

void main() => runApp(TabBarDemo());
