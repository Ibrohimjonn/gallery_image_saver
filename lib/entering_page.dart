import 'package:flutter/material.dart';
import 'package:image_saver/second.dart';

import 'home.dart';

class Entering extends StatefulWidget {
  const Entering({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EnteringState createState() => _EnteringState();
}

class _EnteringState extends State<Entering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Home(title: 'home',)));
              },
              color: Colors.teal,
              child: Text('TAEHYUNG',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 25,),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Second(title: 'second',)));
              },
              color: Colors.teal,
              child: Text('TAEHYUNG_V',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
