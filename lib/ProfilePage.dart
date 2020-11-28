import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/rendering.dart';
import 'Login.dart';
import 'FeedbackScreen.dart';
import 'AboutUs.dart';
import 'ProfileDetails.dart';
class ProfielPage extends StatefulWidget {
  final uname;
  ProfielPage({Key key, @required this.uname}) : super(key: key);
  
  _ProfielPageState createState() => _ProfielPageState(uname: '$uname');
}

class _ProfielPageState extends State<ProfielPage> {
  final auth=FirebaseAuth.instance;
  final uname;
      _ProfielPageState({ @required this.uname}) ;

  String $upno="",$uemail="",$ugender="";

  final DBRef= FirebaseDatabase.instance.reference();
  
  Widget build(BuildContext context) {
    DBRef.once().then((DataSnapshot dataSnapShot)
                    async{
                      Map<dynamic, dynamic> map = await dataSnapShot.value;
                      map.values.toList();
                      map.forEach((value,key) {
                      if(value=="$uname")
                        {
                          $upno= key["upno"];
                          $uemail=key["uemail"];
                          $ugender=key["ugender"];
                        }
                      });
                    });
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
                    child: Text("Profile", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                    ),
                    ),
                ),
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    
                    child: profileUI(context,auth,uname,$upno,$uemail,$ugender),
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}

Widget profileUI(BuildContext context, auth,uname,upno,uemail,ugender) { 
      return Column(
            children: <Widget>[
              Center(
                child: Column( 
                children:[
                  Padding(padding: EdgeInsets.fromLTRB(20,30,20,20),
                  child:Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("asset/Avatar.jpg"),
                        minRadius: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(10, 0,5,5),
                                child: Icon(Icons.portrait_rounded,size: 30,color: HexColor("#071A52"),),
                                ),
                                Padding(padding: EdgeInsets.fromLTRB(0, 0,0,0),
                                child: Text("$uname",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: HexColor("#575151"))),
                                ) 
                              ],
                            ),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(10, 0,5,5),
                                child: Icon(Icons.email,size:30,color: HexColor("#071A52"),),
                                ),
                                Padding(padding: EdgeInsets.fromLTRB(0, 0,0,0),
                                child: Text("$uemail", overflow: TextOverflow.clip,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: HexColor("#575151"))
                                ,  ),
                            ),
                                
                              ],
                            ),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(10, 0,5,5),
                                child: Icon(Icons.phone_android,size: 30,color: HexColor("#071A52"),)                                ),
                                Padding(padding: EdgeInsets.fromLTRB(0, 0,0,0),
                                child: Text("$upno",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: HexColor("#575151"))),
                                )
                              ],
                            ),
                          ]
                        )
                    ]
                    )
                ),
               Padding(
                 padding: EdgeInsets.fromLTRB(0,20,0,20),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ProfileDetails(uname: "$uname",upno:'$upno',uemail:'$uemail',ugender:'$ugender')));
                   },
                   child: Container(
                width: 370.0,
                height: 65,
                decoration: BoxDecoration(
                  color: HexColor('#d8edf0'),
                  borderRadius: BorderRadius.circular(25),
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children:[
                    Padding(padding: EdgeInsets.only(left: 20, right: 20),
                   child: Icon(Icons.portrait,size: 40,color: HexColor("#071A52"),),
                    ),
                Padding(
                    padding: EdgeInsets.only( right: 95),
                    child: Text("Profile Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: HexColor("#575151") ,),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right, size: 40,color: HexColor("#071A52"),),
                  ])
                  ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(0,0,0,20),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => AboutUs(uname: "$uname")));
                   },
                   child: Container(
                width: 370.0,
                height: 65,
                decoration: BoxDecoration(
                  color: HexColor('#d8edf0'),
                  borderRadius: BorderRadius.circular(25),
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children:[
                    Padding(padding: EdgeInsets.only(left: 20, right: 20),
                   child: Icon(Icons.help_outline,size: 40,color: HexColor("#071A52"),),
                    ),
                Padding(
                    padding: EdgeInsets.only( right: 140),
                    child: Text("About", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: HexColor("#575151") ,),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right, size: 40,color: HexColor("#071A52"),),
                  ])
                  ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(0,0,0,20),
                 child: GestureDetector(
                   onTap: (){
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => FeedbackScreen(uname: "$uname")));
                   },
                 
                   child: Container(
                width: 370.0,
                height: 65,
                decoration: BoxDecoration(
                  color: HexColor('#d8edf0'),
                  borderRadius: BorderRadius.circular(25),
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children:[
                    Padding(padding: EdgeInsets.only(left: 20, right: 20),
                   child: Icon(Icons.mail_outline,size: 40,color: HexColor("#071A52"),),
                    ),
                Padding(
                    padding: EdgeInsets.only( right: 125),
                    child: Text("Feedback", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: HexColor("#575151") ,),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right, size: 40,color: HexColor("#071A52"),),
                  ])
                  ),
                 ),
               ) ,
               Padding(
                 padding: EdgeInsets.fromLTRB(0,0,0,0),
                 child: GestureDetector(
                   onTap: () {
                     auth.signOut();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Login()));},
                   
                   child: Container(
                width: 370.0,
                height: 65,
                decoration: BoxDecoration(
                  color: HexColor('#d8edf0'),
                  borderRadius: BorderRadius.circular(25),
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children:[
                    Padding(padding: EdgeInsets.only(left: 20, right: 20),
                   child: Icon(Icons.exit_to_app,size: 40,color: HexColor("#071A52"),),
                    ),
                Padding(
                    padding: EdgeInsets.only( right: 152),
                    child: Text("Logout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: HexColor("#575151") ,),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right, size: 40,color: HexColor("#071A52"),),
                  ])
                  ),
                 ),
               )  
                    ]
                  )
              ),
        ]);
}