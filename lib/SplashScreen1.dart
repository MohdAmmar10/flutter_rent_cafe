import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Welcome.dart';
class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
      body: Center(   
          child: Column(               
            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image.asset('asset/SplashScreen1.jpg'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Text('Book Rooms Anywhere', 
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(20,0,20,20),
                child: Text('Book through Rent-Café to guarantee your first-choice room in advance. If you change your mind, you can rely on our cancellation policy', 
                style: TextStyle(fontSize: 18,),
                textAlign: TextAlign.center,)),
                Padding(padding: EdgeInsets.fromLTRB(250,100,20,20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen2()),
                  );
                },
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(30,8,30,8),
                child: Text('Next',
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

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
      body: Center(   
          child: Column(               
            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image.asset('asset/SplashScreen2.jpg'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Text('Get Protected With                            The Rent-Cafe Guarantee',textAlign: TextAlign.center, 
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(20,0,20,20),
                child: Text('Our guarantee protects you against    last-minute cancellation, unforeseen situtaions and fraud. Your safety is our priority.', 
                style: TextStyle(fontSize: 18,),
                textAlign: TextAlign.center,)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(50,100,20,20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide(color: HexColor("#AFEAF4"),)
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: HexColor("#AFEAF4"),
                    textColor: HexColor("#071A52"),
                    padding: EdgeInsets.fromLTRB(15,8,15,8),
                    child: Text('Previous',
                    style: TextStyle(fontSize: 20,color: HexColor("#071A52")),
                    ),
                    ),
                    )
                    ,Padding(padding: EdgeInsets.fromLTRB(80,100,20,20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide(color: HexColor("#071A52"),)
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SplashScreen3()),
                      );
                    },
                    color:  HexColor("#071A52"),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(30,8,30,8),
                    child: Text('Next',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    ),
                    ),
                  ]
                ),
            ],   
          ), 
        ),
        backgroundColor: Colors.white, 
      )
      );
  }
}


class SplashScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
      body: Center(   
          child: Column(               
            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image.asset('asset/SplashScreen3.jpg'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Text('Quick, Easy And                    Secure',textAlign: TextAlign.center, 
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(20,0,20,20),
                child: Text('As soon as the booking is accepted, Rent-Café will hold the first payment.     We will transfer it to the lesser 48h after the move-in date',
                style: TextStyle(fontSize: 18,),
                textAlign: TextAlign.center,)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(50,35,20,20),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: BorderSide(color: HexColor("#AFEAF4"),)
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    color: HexColor("#AFEAF4"),
                    textColor: HexColor("#071A52"),
                    padding: EdgeInsets.fromLTRB(15,8,15,8),
                    child: Text('Previous',
                    style: TextStyle(fontSize: 20,color: HexColor("#071A52")),
                    ),
                    ),
                    )
                    ,Padding(padding: EdgeInsets.fromLTRB(80,35,20,20),
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
                    padding: EdgeInsets.fromLTRB(30,8,30,8),
                    child: Text('Next',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    ),
                    ),
                  ]
                ),
            ],   
          ), 
        ),
        backgroundColor: Colors.white, 
      )
      );
  }
}

class SplashScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
      body: Center(   
          child: Column(               
            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Image.asset('asset/SplashScreen4.jpg'),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Text('We are Here For You', 
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(20,0,20,20),
                child: Text('Our support team is on hands to            help at anytime', 
                style: TextStyle(fontSize: 18,),
                textAlign: TextAlign.center,)),
                Padding(padding: EdgeInsets.fromLTRB(0,50,0,20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(40,8,40,8),
                child: Text('Continue',
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
