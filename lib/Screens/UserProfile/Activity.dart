import 'package:flutter/material.dart';
import 'package:myfoodbox/Components/AppBar.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(height: size.height*0.07,),
        appBar(size: size, text: 'Your Activity'),
        SizedBox(height: size.height*0.1,),

      ],),
    );
  }
}
