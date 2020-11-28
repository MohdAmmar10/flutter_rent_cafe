import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/ProfilePage.dart';
import 'MyBottomNav.dart';
class AboutUs extends StatefulWidget {
  final uname;
  AboutUs({Key key, @required this.uname}) : super(key: key);
  _AboutUsState createState() => _AboutUsState(uname: '$uname');
}

class _AboutUsState extends State<AboutUs> {
  String sugessions;
  final uname;
  _AboutUsState({ @required this.uname}) ;
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
                    child: Text("About Us", textAlign: TextAlign.left,
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
                          alignment: Alignment.center,
                        child: Padding(padding: EdgeInsets.fromLTRB( 0, 22, 0, 0),
                        child: Text("Rent Cafe",style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
                        )),
                        Align(
                          alignment: Alignment.centerLeft,
                        child: Padding(padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                        child: Text("Our Mission",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
                        )),
                        Padding(padding: EdgeInsets.fromLTRB(0,20,0,0),
                child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  color: HexColor('#FFFFF'),
                  borderRadius: new BorderRadius.circular(13.0),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Text("Rent Cafe is an e-commerce platform with a focus on building an ecosystem to mitigate challenges faced by bachelors while relocating to a new place. Rent Cafe vision is to make the whole relocation process less complicated for everyone. The idea of relocating to a new place is always exciting but as we know it can be a bit challenging as well as it costs a huge efforts & a lot of time to find the perfect place. This process can be really challenging due to various reasons such as unfamiliarity about the state/city, grocery, high brokerage charges and many more.",
                    textAlign: TextAlign.justify,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: HexColor("#071A52")),)
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