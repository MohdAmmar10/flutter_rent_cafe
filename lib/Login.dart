import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/MyBottomNav.dart';
import 'package:rent_cafe/Welcome.dart';
import 'package:email_validator/email_validator.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email,_password;
  final auth = FirebaseAuth.instance;
  final DBRef= FirebaseDatabase.instance.reference();
   GlobalKey<FormState> _key = new GlobalKey();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    child: loginUI(),
                  ),
                ),
          )),
          backgroundColor: Colors.white, 
        ));
  }
Widget loginUI() {
  return  Column(               
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
                      validator: validateUsername,
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
                        Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regex = new RegExp(pattern);
                        if(!regex.hasMatch(value))
                        return 'Invalid Password';
                        else
                        return null;
                      },
                      onSaved: (value){
                    setState(() {
                      _password=value;  
                    });
                    },
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

               _sendToServer();
                    
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
  );
}
void success(){
  
      DBRef.once().then((DataSnapshot dataSnapShot)
      {
        int flag=0,f=0;
        Map<dynamic, dynamic> map = dataSnapShot.value;
        map.values.toList();
        map.forEach((value,key) {
          if(value=="$_email")
          {
            f=1;
            print(value);
            if(key["upass"]=="$_password")
            {
              flag=1;
            }
          }
        });
        if(flag==1)
          {
          final snackbar = new SnackBar(
    content: new Text("Login Sucessful"),
  );
  scaffoldKey.currentState.showSnackBar(snackbar);
  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyBottomNav(uname:'$_email')),
        );
        }
        if(f==1&&flag==0)
        {
          final snackbar = new SnackBar(
    content: new Text("Password Invalid"),
  );
  scaffoldKey.currentState.showSnackBar(snackbar);
        }
        if(f==0)
        {
          final snackbar = new SnackBar(
          content: new Text("User Not Found"),
        );
        scaffoldKey.currentState.showSnackBar(snackbar);
        }

      });

              
                    


}
String validateUsername(String value) {
  if(value.length==0) {
    return "Username is required";
  }
}
_sendToServer(){
  if(_key.currentState.validate()){
    _key.currentState.save();
    success();
    print("Email: $_email, Password: $_password");
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