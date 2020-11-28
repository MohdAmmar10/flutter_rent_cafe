import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ContactOwner extends StatefulWidget {
  @override
  final owner,oemail,opno;
    ContactOwner({this.owner,this.oemail,this.opno});

  // ContactOwner({Key key, @required this.owner, @required this.oemail, @required this.opno}) : super(key: key);
  _ContactOwnerState createState() => _ContactOwnerState(owner,oemail,opno);
}

class _ContactOwnerState extends State<ContactOwner> {
  @override
  final owner,oemail,opno;
  _ContactOwnerState(this.owner,this.oemail,this.opno);
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          
          elevation: 0,
          leading: IconButton(icon:Icon(Icons.arrow_back_ios,size: 30,color:HexColor("#071A52")),onPressed: (){
            Navigator.pop(context);
          },),
        title:  Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                  child: Text("Owner Details", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: HexColor("#071A52"))
                ),
                )
               
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    
                    child: Column(children: [
                      Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
                child: Text("Username: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                child: Text("$owner",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
                child: Text("Email: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                child: Text("$oemail",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
                child: Text("Phone No: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                child: Text("$opno",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0,40,0,0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                  Navigator.pop(context);
                   },                    
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(40,10,40,8),
                child: Text('Back',
                style: TextStyle(fontSize: 20,color: Colors.white),
                
                ),
                ),
                ),
                )
                    ],),
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}