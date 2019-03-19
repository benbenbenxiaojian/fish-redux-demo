import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) => Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(color: Colors.blue[500]),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Navigation menu',
                onPressed: null),
            Expanded(child: title),
            IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null),
          ],
        ),
      );
}

class MyScaffod extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Material(
        child: Column(
          children: <Widget>[
            MyAppBar(
              title: Text(
                'Example title',
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
            Expanded(
                child: Center(
              child: const Text('Hello World!'),
            ))
          ],
        ),
      );
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null),
          title: const Text('Example title TutorialHome'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null)
          ],
        ),
        body: Center(
          child: const Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: const Icon(Icons.add),
          tooltip: 'Add',
        ),
      );
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          print('MyButton was Tapped!');
        },
        child: Container(
          height: 56,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.lightGreen[500],
          ),
          child: Center(
            child: const Text('Engage'),
          ),
        ),
      );
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          CounterDisplay(
            count: _counter,
          ),
          CounterIncrementor(
            onPressed: _increment,
          )
        ],
      );

  void _increment() {
    setState(() {
      _counter++;
    });
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) => Text('Count: $count');
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onPressed,
        child: const Text('increment'),
      );
}

class Product {
  const Product({this.name});

  final String name;
}

typedef CartChangeCallback = void Function(Product produce, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanged})
      : super(key: ObjectKey(product));
  final Product product;
  final bool inCart;

  final CartChangeCallback onCartChanged;

  Color _getColor(BuildContext context) =>
      inCart ? Colors.black54 : Theme.of(context).primaryColor;

  TextStyle _getTextStyle() {
    if (!inCart) {
      return null;
    }
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          onCartChanged(product, !inCart);
        },
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          child: Text(product.name[0]),
        ),
        title: Text(
          product.name,
          style: _getTextStyle(),
        ),
      );
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = Set<Product>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Shopping List'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: widget.products
              .map((product) => ShoppingListItem(
                    product: product,
                    inCart: _shoppingCart.contains(product),
                    onCartChanged: _handleCartChanged,
                  ))
              .toList(),
        ),
      );

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }
}

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Text')),
        body: Text(
          'Hello World',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          textDirection: TextDirection.rtl,
        ),
      );
}

class MyThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen[600],
        accentColor: Colors.pink[300],
      ),
      home: const MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Container(
            color: Theme.of(context).accentColor,
            child: Text(
              'text with a background color',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: FloatingActionButton(
              onPressed: null, child: const Icon(Icons.add)),
        ),
      );
}

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Horizontal List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Horizontal List'),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160,
                  color: Colors.red,
                ),
                Container(
                  width: 160,
                  color: Colors.black54,
                ),
                Container(
                  width: 160,
                  color: Colors.orange,
                ),
                Container(
                  width: 160,
                  color: Colors.pink,
                ),
                Container(
                  width: 160,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160,
                  color: Colors.blue,
                ),
                Container(
                  width: 160,
                  color: Colors.green,
                )
              ],
            )),
      ));
}

class LongList extends StatelessWidget {
  const LongList({
    @required this.items,
    Key key,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text('${items[index]}'),
                )),
      ),
    );
  }
}

class MixedList extends StatelessWidget {
  const MixedList({@required this.items, Key key}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Mixed List',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Mixed List'),
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                if (item is HeadingItem) {
                  return ListTile(
                    title: Text(
                      item.heading,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  );
                } else if (item is MessageItem) {
                  return ListTile(
                    title: Text(item.sender),
                    subtitle: Text(item.body),
                  );
                }
              }),
        ),
      );
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  HeadingItem(this.heading);

  final String heading;
}

class MessageItem implements ListItem {
  MessageItem(this.sender, this.body);

  final String sender;

  final String body;
}

class GridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Grid List',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Grid List'),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
                100,
                (index) => Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline,
                      ),
                    )),
          ),
        ),
      );
}

class Gesture extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Gesture Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Gesture Demo'),
          ),
          body: Center(
            child: InkwellButton(),
          ),
        ),
      );
}

class TapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          const snackBar = SnackBar(
            content: Text('tap'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('My Button'),
        ),
      );
}

class InkwellButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(const SnackBar(content: Text('tap')));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const Text('Flat Button'),
        ),
      );
}

//'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552301147870&di=cc96288bc6e5661fa449f158732ecfac&imgtype=0&src=http%3A%2F%2Fv1.qzone.cc%2Fpic%2F201608%2F15%2F20%2F19%2F57b1b343297d4387.jpeg%2521600x600.jpg',
