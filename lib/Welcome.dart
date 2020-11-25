import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/Signup.dart';
import 'Login.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
      body: Center(   
          child: Column(               
            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image.asset('asset/Welcome.jpg'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 40 , 20, 20),
                child: Text('Say Hello To Rent-Cafe', 
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(0,60,0,20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                color:  Colors.white,
                textColor: HexColor("#071A52"),
                padding: EdgeInsets.fromLTRB(60,8,60,8),
                child: Text('Login',
                style: TextStyle(fontSize: 20,color: HexColor("#071A52")),
                ),
                ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0,10,0,20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(50,8,50,8),
                child: Text('Sign Up',
                style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                ),
                )
            ],   
          ), 
        ),
        backgroundColor: Colors.white, 
      )
      
      );
  }
}
