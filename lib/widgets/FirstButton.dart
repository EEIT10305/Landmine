import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstButton extends StatefulWidget {
  final String routerName;
  final Map args;
  final String buttonWord;

  FirstButton(
      {Key key,
      @required this.routerName,
      this.args,
      @required this.buttonWord})
      : super(key: key);

  @override
  _FirstButtonState createState() => _FirstButtonState();
}

class _FirstButtonState extends State<FirstButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed(widget.routerName, arguments: widget.args);
      },
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(15),
        child: Text(
          widget.buttonWord,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white70,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
