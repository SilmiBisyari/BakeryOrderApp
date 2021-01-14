import 'order.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

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
                  margin: EdgeInsets.all(20),

                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Select The Cake Menu', textAlign: TextAlign.center, style: GoogleFonts.lemon()),
                      /*ElevatedButton(
                       child: Text('Launch screen'),
                      onPressed: () {
                       Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context)  => order())
                       );
               }*/
                    ]
                ),
                Container(
                 margin:EdgeInsets.all(10),
                ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ChocoCake.jpeg',
                      height: 50,
                      width :50,
                    )
              ]
          ),
                Container(
                  margin:EdgeInsets.all(10),
                ),
            RaisedButton(
              padding: const EdgeInsets.all(10),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)  => order()));},
                child: const Text(
                  'Choco Cake',
                    style: TextStyle(fontSize: 20),
                ),
            ),
                Container(
                  margin:EdgeInsets.all(10),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/CookiesCake.jpg',
                        height: 100,
                        width :150,
                      )
                    ]
                ),
                Container(
                  margin:EdgeInsets.all(10),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)  => order()));},
                  child: const Text(
                    'Cookies Cake',
                    style: TextStyle(fontSize: 20),
                  ),
                ),Container(
                  margin:EdgeInsets.all(10),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/IceCake.jfif',
                        height: 100,
                        width :100,
                      )
                    ]
                ),
                Container(
                  margin:EdgeInsets.all(10),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)  => order()));},
                  child: const Text(
                    'Ice Cake',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        ])
      )
    );
  }
}

