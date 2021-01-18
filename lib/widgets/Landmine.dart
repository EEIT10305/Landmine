import 'package:flutter/cupertino.dart';

import 'Square.dart';



class Landmine extends StatefulWidget {
  final List data;
  final List flags;
  const Landmine({Key key, this.data, this.flags}): super(key: key);
  @override
  _LandmineState createState() => _LandmineState();
}

class _LandmineState extends State<Landmine> {
  @override
  Widget build(BuildContext context) {
    List data = widget.data;
    List flags = widget.flags;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            GestureDetector(
          onTap:(){
            setState(() {
              for(int i = 0 ; i < widget.flags.length ; i++){
                List list = widget.flags[i];
                for(int j = 0 ; j < list.length ; j++){
                  list[j] = false;
                }
              }
            });
            print(flags.join(','));
          },
          child: Square(
            text: 'start',
            flag: true,
          ),
        ),
          ],
        ),
        for (int i = 0 ; i < data.length ; i++)
          Row(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
              for (int j = 0 ; j < data[i].length ; j++)
                GestureDetector(
                  onTap:(){
                    setState(() {
                      flags[i][j] = true;
                    });
                    print(flags.join(','));
                  },
                  child: Square(
                    text: data[i][j].toString(),
                    flag: flags[i][j],
                  ),
                ),
            ],
          )
      ],
    );
  }
}