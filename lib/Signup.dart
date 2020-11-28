import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/MyBottomNav.dart';
import 'Login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/rendering.dart';
import 'HomePage.dart';
class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final auth = FirebaseAuth.instance;
  final DBRef= FirebaseDatabase.instance.reference();
  String uname,_email,pno,pass,gender,male="Male",female="Female";
  bool _validate = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
        key: scaffoldKey,
      body: Center(
              child: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                  child: Form(
                    key: _key,
                    autovalidate: _validate,
                    child: formUI(),
                  ),
                ),
          )),
          backgroundColor: Colors.white, 
        ));
  }
Widget formUI() {
  return Column(

            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(20, 80 , 20, 10),
                child: Text('SignUp', 
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(18,30,0,20),
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
                      hintText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (_email)=> EmailValidator.validate(_email)
                          ? null
                          : "Invalid Email Address",
                      autofocus: true,
                      onSaved: (String value){
                      _email=value;  

                    },
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
                      hintText: 'Username',
                      ),
                      validator: validateUsername,
                      onSaved: (value){
                    setState(() {
                      uname=value;  
                    });
                    },
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
                      obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible?Icons.visibility:Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: ()
                          {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          ),
                      border: InputBorder.none,
                      hintText: 'Password',
                      ),
                      validator: (value){
                        Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';;
                        RegExp regex = new RegExp(pattern);
                        if(!regex.hasMatch(value))
                        return 'Invalid Password';
                        else
                        return null;
                      },
                      onSaved: (value){
                    setState(() {
                      pass=value;  
                    });
                    },
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
                      hintText: 'Phone Number',
                      ),
                      validator: validateMobile,
                      onSaved: (String value) {
                        pno = value;
                      }),
          
                    ),
                  ),
                  ),
                
                Padding(
                  padding: EdgeInsets.fromLTRB(70,10,0,20),
                child: Row(
                  children: <Widget>[
                    Text('Gender',style: TextStyle(fontSize: 18,)),
                    Radio(
                      activeColor: Theme.of(context).primaryColor,
                      value: male,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          gender=value;
                        });
                      },
                    ),
                    Text('Male',style: TextStyle(fontSize: 18,)),
                    Radio(
                      activeColor: Theme.of(context).primaryColor,
                      value: female,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          gender=value;
                        });
                      },
                    ),
                    Text('Female',style: TextStyle(fontSize: 18,)),
                  ],
                ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0,15,0,20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                  _sendToServer();
                    
                },
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(55,10,55,8),
                child: Text('SignUp',
                style: TextStyle(fontSize: 20,color: Colors.white),
                
                ),
                ),
                ),
                
                Padding(padding: EdgeInsets.fromLTRB(20,180,20,20),
                child: GestureDetector(        
                child: Text('Already have an account? Login', 
                style: TextStyle(fontSize: 16,),
                textAlign: TextAlign.center,),
                onTap: () {
                  
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Login()));}
                )
                ),
            ],   
          );} 

void success(){
  // auth.createUserWithEmailAndPassword(email: _email, password: pass);
  DBRef.child("$uname").set({
    'uname': '$uname',
    'uemail': '$_email',
    'upass': '$pass',
    'upno': '$pno',
    'ugender': '$gender',
  });
  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyBottomNav(uname:'$uname')),
                  );
  final snackbar = new SnackBar(
    content: new Text("Registeration Sucessful"),
  );
  scaffoldKey.currentState.showSnackBar(snackbar);

}
String validateUsername(String value) {
  if(value.length==0) {
    return "Username is required";
  }
}

String validateName(String value) {
  String pattern = r'(^[a-z A-Z,.\-]+$)';
  RegExp regExp = new RegExp(pattern);
  if(value.length==0) {
    return "Name is required";
  }
  else if (!regExp.hasMatch(value)){
    return "Name must be between a-z or A-z";
  }
  return null;
}

String validateMobile(String value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(pattern);
  if(value.length==0) {
    return "Mobile No. is required";
  }
  else if (value.length<10){
    return "Mobile No. should be of 10 digit";
  }
  else if (!regExp.hasMatch(value)){
    return "Number must be between 0-9";
  }
  return null;
}

_sendToServer(){
  if(_key.currentState.validate()){
    _key.currentState.save();
    success();
    print("Userame: $uname,Email: $_email, Password: $pass and Phone No: $pno, gender=$gender");
  }
  else{
    setState(() {
      _validate = true;
    });
  }
}
}

class LoginPage extends State<Signup> {
  // @override
  // Widget build(BuildContext context) {
   
  //  widget.recordObje
  // }

  GlobalKey<FormState> _key;
  LoginPage(this._key);  //constructor
  @override
  Widget build(BuildContext context) {   //closure has access
   //.....
    print(_key);
  }
}