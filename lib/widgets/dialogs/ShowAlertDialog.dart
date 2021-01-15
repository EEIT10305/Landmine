
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAlertDialog extends StatefulWidget {
  final String content;
  ShowAlertDialog({Key key, this.content}) : super(key: key);
  @override
  _ShowAlertDialogState createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(child:
    AlertDialog(
      content: Text(widget.content),
      actions: <Widget>[
        FlatButton(onPressed: ()=>Navigator.of(context).pop(), child: Text('OK'))
      ],
    ),);
  }
}