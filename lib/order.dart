import 'package:flutter/material.dart';
import 'package:fradio/fradio.dart';
import 'package:stepo/stepo.dart';
import 'dart:math';

void main() => runApp(order());

class order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORDER CART',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'ORDER CART'),
    );
  }
}
enum cake {ChocoCake,IceCake,CookiesCake}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TextEditingController weightController = TextEditingController();
  //TextEditingController heightController = TextEditingController();


  cake _character = cake.ChocoCake;
  double _Order = 0.0;
  double cakeprice ;
  int candles = 0;
  int sprinkles = 0;

  void _setOrder() {
    setState(() {
      _Order = cakeprice + (candles*0.50) + (sprinkles*1.0);
    });
    _showDialog('Total Cost : RM $_Order');
  }
  void _showDialog(String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("TOTAL", textAlign: TextAlign.center),
          content: new Text(status),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                _Order=0.0;
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
                Text("      "),
                Image.asset("assets/images/ChocoCake.jpeg",
                  height: 100,
                  width: 100,
                  ),
                Image.asset("assets/images/CookiesCake.jpg",
                  height: 100,
                  width: 200,),
                Image.asset("assets/images/IceCake.jfif",
                 height:150,
                  width:70,
                ),
                ]
            ),
            Row(
              children:<Widget>[
              new Text("             Choco Cake              "),
              new Text("      Cookies Cake           "),
                new Text("      Ice Cake"),
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
                   });
                 },
               ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: new Text("OPTIONAL",textAlign: TextAlign.center)
            ),
            Row(
              children:<Widget>[
                  new Text("                     Candles:                                          "),
            Stepo(
              key: UniqueKey(),
              width: 50,                                         //Optional
              backgroundColor: Colors.deepOrange,                 //Optional
              style: Style.horizontal,                              //Optional
              textColor: Colors.white,                            //Optional
              animationDuration: Duration(milliseconds: 500),     //Optional
              iconColor: Colors.white,                            //Optional
              fontSize: 20,                                       //Optional
              iconSize: 10,                                       //Optional
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
                new Text("                     Sprinklers :                                      "),
            Stepo(
              key: UniqueKey(),
              width: 50,                                         //Optional
              backgroundColor: Colors.deepOrange,                 //Optional
              style: Style.horizontal,                              //Optional
              textColor: Colors.white,                            //Optional
              animationDuration: Duration(milliseconds: 500),     //Optional
              iconColor: Colors.white,                            //Optional
              fontSize: 10,                                       //Optional
              iconSize: 20,                                       //Optional
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

           /* Container(
              margin: EdgeInsets.all(10),
              child: Text(_Order.toStringAsFixed(2))),*/
            Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text('Checkout'),
                  onPressed: _setOrder,
                )),

          ],
        ),
      ),
    );
  }
}

