import 'package:flutter/material.dart';
class MyCard extends StatefulWidget {
  String content;
  MyCard({this.content='-'});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.indigoAccent,
        elevation: 15.0,
        child:
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              child: Center(child: Text(widget.content),),
            )
        )
    );
  }
}
