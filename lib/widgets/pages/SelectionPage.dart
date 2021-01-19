import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyScaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  String result;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(result ?? '課程選擇'),
      onPressed: () {
        _navigatorAndDisplaySelection(context);
      },
    );
  }

  _navigatorAndDisplaySelection(BuildContext context) async {
    result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text('$result'),
      ));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text('Android'),
                onPressed: () {
                  Navigator.pop(context, 'Android');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text('IOS'),
                onPressed: () {
                  Navigator.pop(context, 'IOS');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text('flutter'),
                onPressed: () {
                  Navigator.pop(context, 'flutter');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
