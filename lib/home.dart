import 'order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bakeryorderapp/login.dart';
import 'display.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BakeryOrderApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:
      Colors.orange,
      ),
      home: myhomepage(title: 'Bakery Order App'),
    );
  }
}
class myhomepage extends StatefulWidget {
  myhomepage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _myhomePageState createState() => _myhomePageState();
}

class _myhomePageState extends State<myhomepage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text(widget.title, textAlign: TextAlign.center)
          ),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: new Text(' '),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Welcome to The Bakery Order App.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lemon()),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                          'Please Select Cake.', textAlign: TextAlign.center,
                          style: GoogleFonts.lemon()),
                    ]
                ),
                Container(
                  margin: EdgeInsets.all(10),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/ChocoCake.jpeg',
                        height: 100,
                        width: 100,
                      )
                    ]
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => order()));
                  },
                  child: const Text(
                    'Choco Cake',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/CookiesCake.jpg',
                        height: 150,
                        width: 150,
                      )
                    ]
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => order()));
                  },
                  child: const Text(
                    'Cookies Cake',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/IceCake.jfif',
                        height: 100,
                        width: 150,
                      )
                    ]
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => order()));
                  },
                  child: const Text(
                    'Ice Cream Cake',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  child: new Text(' '),
                ),

                Container(
                  child: RaisedButton(child: Text('Logout'), onPressed: () {
                    auth.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },),

                ),
              ]),
        )
    );
  }

}