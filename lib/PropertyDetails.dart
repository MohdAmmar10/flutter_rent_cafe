import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/ContactOwner.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:rent_cafe/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class PropertyDetails extends StatefulWidget {
  final DocumentSnapshot dat;
  PropertyDetails({this.dat});
  @override
  _PropertyDetailsState createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  // final dat;
  // _PropertyDetailsState({ @required this.dat}) ;
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
                  child: Text("Property Details", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: HexColor("#071A52"))
                ),
                )
               
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    
                    child: propertyUI(context,widget.dat),
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}

Widget propertyUI(context,db) {
    final DBRef= FirebaseDatabase.instance.reference();
    String opno,oemail;
    String _image=db["cover_img"];
  return Column(             
            children: <Widget>[
                    
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: InkWell(
                onTap: (){},
                child: Image.network("https://firebasestorage.googleapis.com/v0/b/rent-cafe.appspot.com/o/"+"$_image"+"?alt=media&token=0db2f382-4b50-438a-ac20-feec7ddcf032",
                          height: 158,
                          alignment: Alignment.topCenter,
                          // image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/rent-cafe.appspot.com/o/"+"$db['cover_url']"+"?alt=media&token=0db2f382-4b50-438a-ac20-feec7ddcf032",
                          fit: BoxFit.fitWidth,
                        ),
                      
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                  child:Text(db["addr"]+",",textAlign: TextAlign.start,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: HexColor("#071A52")))
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child:Text(db["appt"]+",",textAlign: TextAlign.start,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: HexColor("#071A52")))
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child:Text(db["size"]+" sqft.",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: HexColor("#071A52")))
                  ),
                ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                  child:Text("Starts From",textAlign: TextAlign.start,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: HexColor("#071A52")))
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                  child:Text("₹ "+ db["price"]+"/-",textAlign: TextAlign.start,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: HexColor("#071A52")))
                  ),
              ]
            )
            ]
          ),
          Align(
            alignment: Alignment.centerLeft,
          child:Padding(padding: EdgeInsets.fromLTRB(25,13,0,0),
          child: Text("Description:",textAlign: TextAlign.start,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: HexColor("#071A52")))
          ),
          ),
          Align(
            alignment: Alignment.center,
          child:Container(
                width: 370,
                height: 97,
                decoration: BoxDecoration(
                  color: HexColor('#FFFFF'),
                  borderRadius: new BorderRadius.circular(13.0),
                ),
                child: Padding(padding: EdgeInsets.fromLTRB(5,5,5,5),
                child: Text(db["descr"],textAlign: TextAlign.justify,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52")))
          )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Text("Deposit Amount: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text("₹ "+ db["dep_amt"]+"/-",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                child: Text("AC Rooms: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text(db["ac_rooms"],style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                child: Text("Electric Charges: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text("₹ "+db["elec_chrg"]+"/-",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                child: Text("Maintainance Charges: ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: HexColor("#071A52"))),
              ),
              Padding(padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                child: Text("₹ "+db["main_chrg"]+"/-",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52"))),
              ),
            ]
          ),
          Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0,30,0,0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                  DBRef.once().then((DataSnapshot dataSnapShot)
                  {
                    Map<dynamic, dynamic> map = dataSnapShot.value;
                    map.values.toList();
                    map.forEach((value,key) {
                      if(value==db["ow_un"])
                      {
                        opno=key["upno"];
                        oemail=key["uemail"];
                      }
                    });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ContactOwner(owner:db["ow_un"],oemail:oemail,opno:opno)));
                  });
                },                    
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(30,10,30,8),
                child: Text('Contact Owner',
                style: TextStyle(fontSize: 20,color: Colors.white),
                
                ),
                ),
                ),
                )
        ]
        );
        }