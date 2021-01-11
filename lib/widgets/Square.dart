import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  final String text;
  final String style;
  final bool flag;

  const Square({Key key, this.text, this.style, this.flag}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    if(!widget.flag){
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border(
            top: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
          ),
        ),
      );
    }
    return Container(
      width: 30,
      height: 30,
      child: Center(
        child: Text(widget.text),
      ),
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border(
            top: BorderSide(color: Colors.white),
            left: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
          ),
      ),
    );
  }
}
