import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class  DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BakeryOrderApp',
        debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.orange,
       ),
      home: myhomepage(title:'ORDER CART'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(

          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Menu',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
            )),]));

  }
}



