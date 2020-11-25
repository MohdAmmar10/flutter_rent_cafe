import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/Welcome.dart';
import 'package:rent_cafe/main.dart';
import 'Signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
      body: Center(   
          child: Column(               
            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(20, 120 , 20, 20),
                child: Text('Welcome', 
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(18,40,0,20),
                child: Container(
                width: 300.0,
                decoration: BoxDecoration(
                  color: HexColor('#F0F0F0'),
                  borderRadius: new BorderRadius.circular(13.0),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 5),
                    child: TextFormField(
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      ),
                    ),
                  ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(18,10,0,20),
                child: Container(
                width: 300.0,
                decoration: BoxDecoration(
                  color: HexColor('#F0F0F0'),
                  borderRadius: new BorderRadius.circular(13.0),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 5),
                    child: TextFormField(
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      ),
                    ),
                  ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(190,0,20,20),
                child: GestureDetector(                
                child: Text('Forget Password ?',
                  style: TextStyle(fontSize: 16,color: HexColor('071A52')),
                ),
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Welcome()));}
                ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0,15,0,20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen4()),
                  );
                },
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(55,10,55,8),
                child: Text('Login',
                style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(20,300,20,20),
                child: GestureDetector(        
                child: Text('Do not have a account yet? Sign Up', 
                style: TextStyle(fontSize: 16,),
                textAlign: TextAlign.center,),
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Signup()));}
                )
                ),
            ],   
          ), 
        ),
        backgroundColor: Colors.white, 
      )
      
      );
  }
}
