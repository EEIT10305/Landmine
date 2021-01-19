import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const MyScaffold({Key key, this.title, @required this.child})
      : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title??''),
      ),
      body: widget.child,
    );
  }
}
