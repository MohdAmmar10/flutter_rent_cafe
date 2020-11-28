import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/ProfilePage.dart';
import 'MyBottomNav.dart';
class ProfileDetails extends StatefulWidget {
  final uname,upno,uemail,ugender;
  ProfileDetails({Key key, @required this.uname, @required this.upno, @required this.uemail, @required this.ugender,}) : super(key: key);
  _ProfileDetailsState createState() => _ProfileDetailsState(uname: '$uname',upno: '$upno',uemail: '$uemail', ugender: '$ugender');
}

class _ProfileDetailsState extends State<ProfileDetails> {
  String sugessions;
  final uname,upno,uemail,ugender;
  _ProfileDetailsState({ @required this.uname, @required this.upno, @required this.uemail, @required this.ugender}) ;
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
                    child: Text("Profile Details", textAlign: TextAlign.left,
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
                        Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(35, 40,0,0),
                                child: Icon(Icons.account_circle_outlined,size: 30,color: HexColor("#071A52"),),
                                ),
                                Align(
                                alignment: Alignment.centerLeft,
                              child: Padding(padding: EdgeInsets.fromLTRB(5, 40, 0, 0),
                              child: Text("Username: $uname",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
                              )),
                              ],
                            ),
                        Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(35, 30,0,0),
                                child: Icon(Icons.location_history,size: 30,color: HexColor("#071A52"),),
                                ),
                                Align(
                          alignment: Alignment.centerLeft,
                        child: Padding(padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                        child: Text("Gender: $ugender",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
                        )),
                              ],
                            ),
                        Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(35, 30,0,0),
                                child: Icon(Icons.email_outlined,size: 30,color: HexColor("#071A52"),),
                                ),
                               Align(
                          alignment: Alignment.centerLeft,
                        child: Padding(padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                        child: Expanded(child:Text("Email: $uemail",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),)
                        )),
                              ],
                            ),
                        Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(35, 30,0,0),
                                child: Icon(Icons.phone,size: 30,color: HexColor("#071A52"),),
                                ),
                                Align(
                          alignment: Alignment.centerLeft,
                        child: Padding(padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                        child: Text("Phone No.: $upno",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
                        )),
                              ],
                            ),
                        Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0,35,0,0),
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
                      ]
                    ),
                    
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}