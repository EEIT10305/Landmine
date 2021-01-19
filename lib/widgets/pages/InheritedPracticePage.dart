import 'package:flutter/material.dart';

import '../MyScaffold.dart';

class Item {
  String reference;

  Item(this.reference);
}

class _Myinherited extends InheritedWidget {
  final MyInheritedWidgetState data;

  _Myinherited({Key key, Widget child, this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_Myinherited oldWidget) {
    return true;
  }
}

class MyInheritedWidget extends StatefulWidget {
  final Widget child;

  MyInheritedWidget({Key key, this.child}) : super(key: key);

  @override
  MyInheritedWidgetState createState() => MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context,
      {bool rebuild = true}) {
    return (rebuild
            ? context.inheritFromWidgetOfExactType(_Myinherited) as _Myinherited
            : context.ancestorWidgetOfExactType(_Myinherited) as _Myinherited)
        .data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {
  List<Item> _items = <Item>[];

  int get itemsCount => _items.length;

  void addItem(String reference) {
    print(_items);
    setState(() {
      _items.add(Item(reference));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _Myinherited(
      data: this,
      child: widget.child,
    );
  }
}

class MyTree extends StatefulWidget {
  @override
  _MyTreeState createState() => _MyTreeState();
}

class _MyTreeState extends State<MyTree> {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: MyScaffold(
        title: 'InheritedWidgetPractice',
        child: Column(
          children: [
            WidgetA(),
            Container(
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                  WidgetB(),
                  WidgetC(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state =
        MyInheritedWidget.of(context, rebuild: false);
    return Container(
      child: RaisedButton(
        child: Text('Add Item'),
        onPressed: () {
          state.addItem('new Item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return Text('${state.itemsCount}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('I\'m widget C.');
  }
}
