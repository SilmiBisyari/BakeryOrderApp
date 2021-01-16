import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fradio/fradio.dart';
import 'package:stepo/stepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference CakeOrder = FirebaseFirestore.instance.collection('Cake Order');

class view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'History',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: display(title: 'History', ),
    );
  }
}
class display extends StatefulWidget {
  display({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _display createState() => _display();
}
class _display extends State<display> {

  final auth = FirebaseAuth.instance;

  void _onPressed2() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(widget.title, textAlign: TextAlign.center)),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: _onPressed2,
                  child: const Text(
                    'Check Out', style: TextStyle(fontSize: 20),)
                  ,)
              ],
            )
        )
    )
    ;
  }


}
