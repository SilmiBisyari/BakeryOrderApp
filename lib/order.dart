import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fradio/fradio.dart';
import 'package:stepo/stepo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bakeryorderapp/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference CakeOrder = FirebaseFirestore.instance.collection('Cake Order');


class order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORDER CART',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
        home: MyHomePage(title: 'CAKE ORDER', ),
    );
  }
}
enum cake {ChocoCake,IceCake,CookiesCake}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  Future<void> addcakeorder() {
    return CakeOrder
        .add({'Cakename': namecake, 'candles': candles, 'sprinkles': sprinkles, 'TotalPrice' : _Order})
        .then((value) => print("Cake Added"))
        .catchError((error) => print("Failed to add Cake Order: $error"));
  }

  final auth = FirebaseAuth.instance;

  cake _character ;
  String namecake =' ';
  double _Order = 0.0;
  double cakeprice ;
  int candles = 0;
  int sprinkles = 0;

  void _setOrder() {
    setState(() {
      _Order = cakeprice + (candles*0.50) + (sprinkles*1.0);
      addcakeorder();
    });
    _showDialog('Total Cost : RM $_Order .                       Cake : $namecake .                                   Candle : $candles . Sprinkles : $sprinkles',);
  }


  void _showDialog(String status,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("TOTAL", textAlign: TextAlign.center),
          content: new Text(status),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close",),
              onPressed: () {
                Navigator.of(context).pop();
                candles = 0;
                sprinkles = 0;
              },
            ),
          ],
        );
      },
    );
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
            Row(
              children:<Widget> [
                Text("     "),
                Image.asset("assets/images/ChocoCake.jpeg",
                  height: 100,
                  width: 100,
                  ),
                Image.asset("assets/images/CookiesCake.jpg",
                  height: 100,
                  width: 150,),
                Image.asset("assets/images/IceCake.jfif",
                 height:150,
                  width:70,
                ),
                ]
            ),
            Row(
              children:<Widget>[
              new Text("      Choco Cake              "),
              new Text("   Cookies Cake       "),
                new Text("  Ice Cake"),
            ]
            ),
            Container(
              margin: EdgeInsets.all(20),

            ),

            ListTile(
              title: const Text('ChocoCake                               RM 25'),
                      leading: FRadio(
                        selectedColor: Color(0xffffc900),
                      value: cake.ChocoCake,
                      groupValue: _character,
                      onChanged: (cake value) {
                      setState(() {
                        _character = value;
                         cakeprice = 25;
                        namecake = 'Choco Cake';
                           });
                       },
                   ),),

            ListTile(
                     title: const Text('Cookies Cake                           RM 45'),

                       leading: FRadio(
                         selectedColor: Color(0xffffc900),
                        value: cake.CookiesCake,
                      groupValue: _character,
                        onChanged: (cake value) {
                         setState(() {
                    _character = value;
                    namecake = 'Cookies Cake';
                    cakeprice = 45;
                  });
                },
              ),
            ),
            ListTile(
                        title: const Text('Ice Cake                                    RM 70'),

                        leading: FRadio(
                          selectedColor: Color(0xffffc900),
                          value: cake.IceCake,
                          groupValue: _character,
                          onChanged: (cake value) {
                          setState(() {
                          _character = value;
                          cakeprice = 70;
                          namecake = 'Ice Cake';
                   });
                 },
               ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: new Text("OPTIONAL",textAlign: TextAlign.center, style: GoogleFonts.lemon())
            ),
            Row(
              children:<Widget>[
                  new Text("              Candles: (RM0.50)                 ",style: GoogleFonts.lemon()),
                Stepo(
              key: UniqueKey(),
              width: 70,                                         //Optional
              backgroundColor: Colors.deepOrange,                 //Optional
              style: Style.horizontal,                              //Optional
              textColor: Colors.white,                            //Optional
              animationDuration: Duration(milliseconds: 1),     //Optional
              iconColor: Colors.white,                            //Optional
              fontSize: 20,                                       //Optional
              iconSize: 200,                                       //Optional
              initialCounter: 0,                                 //Optional
              lowerBound: 0,                                     //Optional
              upperBound: 100,                                     //Optional
              onIncrementClicked: (counter) {
                candles++;//Optional
                print("Increment clicked");
              },
              onDecrementClicked: (counter) {
                candles--;//Optional
                print("Decrement clicked");
                },
              )
            ]),

            Container(
                margin: EdgeInsets.all(20),
            ),

            Row(
              children:<Widget>[
                new Text("              Sprinklers :(RM1.00)            ",style: GoogleFonts.lemon()),
            Stepo(
              key: UniqueKey(),
              width: 70,                                         //Optional
              backgroundColor: Colors.deepOrange,                 //Optional
              style: Style.horizontal,                              //Optional
              textColor: Colors.white,                            //Optional
              animationDuration: Duration(milliseconds: 1),     //Optional
              iconColor: Colors.white,                            //Optional
              fontSize: 10,                                       //Optional
              iconSize: 50,                                       //Optional
              initialCounter: 0,                                 //Optional
              lowerBound: 0,                                     //Optional
              upperBound: 100,                                     //Optional
              onIncrementClicked: (counter1) {
                sprinkles++;//Optional
                print("Increment clicked");
              },
              onDecrementClicked: (counter1) {
                sprinkles--;//Optional
                print("Decrement clicked");
              },
            ),]),

            Container(
              margin: EdgeInsets.all(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)  => MyApp()));},
                      child: const Text(
                      'Back',
                        style: TextStyle(fontSize: 20),
              ),
            ),
                new Text("          "),
                RaisedButton(
                    padding: const EdgeInsets.all(10),
                    onPressed: _setOrder,
                    child: const Text('Check Out', style: TextStyle(fontSize: 20),)
                  ,)]

            )],
        ),
      ),
    );
  }
}

