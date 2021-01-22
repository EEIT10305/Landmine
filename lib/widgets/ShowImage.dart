import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ShowImage extends StatefulWidget {
  final String base64;

  const ShowImage({Key key, this.base64}): super(key: key);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    String base64 = widget.base64;
    if(base64 == ''){
      return Container();
    }
    Uint8List uint8list = Base64Decoder().convert(base64);
    return Container(child: Image.memory(uint8list),);
  }
}
