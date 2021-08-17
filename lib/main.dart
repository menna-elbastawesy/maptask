import 'package:flutter/material.dart';
import 'package:maptask/screens/UserScreen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  UserScreen () ,
    );
  }

}
