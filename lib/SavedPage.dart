import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SavedPage extends StatefulWidget {
  final uname;
  SavedPage({Key key, @required this.uname}) : super(key: key);
  _SavedPageState createState() => _SavedPageState(uname: '$uname');
}

class _SavedPageState extends State<SavedPage> {

  final uname;
  _SavedPageState({ @required this.uname}) ;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        title:  Padding(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
              child: 
                 Container(padding: EdgeInsets.fromLTRB(0,10,15,0),
                    child: Text("Saved", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                    ),
                    ),
                ),
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    
                    child: savedUI(uname),
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}

Widget savedUI(uname) {
  return Column(             
            children: <Widget>[
                 Center(
                   child: Column( 
                    children:[
                    Padding(
                     padding: EdgeInsets.all(15.0),
                     child: Card(
                       clipBehavior: Clip.antiAlias,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Padding(padding: EdgeInsets.fromLTRB(0,10,10,0),
                                  child: Icon(Icons.favorite,color: HexColor('#FF304F'), size: 35,) ,
                                  ),
                                  Ink.image(
                                    height:170,
                                    alignment: Alignment.topCenter,
                                    image: AssetImage('asset/Prop1.jpg'),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(15,0,15,10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("805 Tulsi Tower", 
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: HexColor("#575151")),
                                    ),
                                    Text("3 BHK Apartment", 
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: HexColor("#575151")),
                                    ),  
                                  ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top:10),
                                  child: Row(
                                    children: [ Text("Starts From", 
                                      style: TextStyle(fontSize: 12,color: HexColor("#575151")),
                                    ),
                                  ],
                                  )
                                  ),
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("₹ 10000/-", 
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                                    ),
                                    Text("500 sqft.", 
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                                    ),  
                                  ],
                                  ),
                                ]
                              ),
                              ),  
                            ],
                          ),
                        ),
                     ),
                   ),
                    ],
                   ),
                 ),
            ]
          );
   }