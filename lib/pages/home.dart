import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   return new Container(
     child: Text("Home", textScaleFactor: 2.0,),
   );
  }
}