import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/ProfilePage.dart';
import 'MyBottomNav.dart';
class FeedbackScreen extends StatefulWidget {
  final uname;
  FeedbackScreen({Key key, @required this.uname}) : super(key: key);
  _FeedbackScreenState createState() => _FeedbackScreenState(uname: '$uname');
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String sugessions;
  final uname;
  _FeedbackScreenState({ @required this.uname}) ;
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        title:  Padding(
                  padding: EdgeInsets.fromLTRB(15,20,0,0),
              child: 
                 Container(padding: EdgeInsets.fromLTRB(0,10,15,0),
                    child: Text("Feedback", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                    ),
                    ),
                ),
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                        child: Padding(padding: EdgeInsets.fromLTRB(35, 40, 0, 0),
                        child: Text("Any Sugession?",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
                        )),
                        Padding(padding: EdgeInsets.fromLTRB(0,20,0,0),
                child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  color: HexColor('#F0F0F0'),
                  borderRadius: new BorderRadius.circular(13.0),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 5),
                    child: TextFormField(
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Sugessions',
                      ),
                      onSaved: (value){
                    setState(() {
                      sugessions=value;  
                    });
                    },
                    ),
                  ),
                  ),
                ),
                Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0,30,0,0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => MyBottomNav(uname: "$uname")));
                   },                    
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(40,10,40,8),
                child: Text('Submit',
                style: TextStyle(fontSize: 20,color: Colors.white),
                
                ),
                ),
                ),
                )
                      ]
                    ),
                    
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}