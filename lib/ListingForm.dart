
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
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
class ListingForm extends StatefulWidget {
  final uname;
ListingForm({Key key, @required this.uname}) : super(key: key);
  @override
  _ListingFormState createState() => _ListingFormState(uname:uname);
}

class _ListingFormState extends State<ListingForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  final uname;
    _ListingFormState({ @required this.uname}) ;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
    String addr,price,appt,size,descr,dep,ac,elec,maint,male="Available",female="Not Available";
  bool _validate = false;
  bool _passwordVisible = false;
  File _image; 
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
                    child: propFormUI(context),
                  ),
                ),
          )),
          backgroundColor: Colors.white, 
        ));
  }
Widget propFormUI(context) {
  Future getImage()async{
    var image= await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image=image;
      print("image path $_image");

    });
    
  }
  Future uploadPic(BuildContext context) {
  String fn=basename(_image.path);
  Reference firebaseStorageRef=FirebaseStorage.instance.ref().child(fn);
  UploadTask uploadTask = firebaseStorageRef.putFile(_image);
  // TaskSnapshot taskSnapshot = await 
  }
  return Column(

            children: <Widget>[   
              Padding(padding: EdgeInsets.fromLTRB(20, 80 , 20, 10),
                child: Text('Add New Property', 
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: HexColor("#071A52")))),
                Padding(padding: EdgeInsets.fromLTRB(18,20,0,20),
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
                      hintText: 'Address',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: validateUsername,

                      autofocus: true,
                      onSaved: (String value){
                      addr=value;  
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
                      hintText: 'Appartment Size',
                      ),
                      validator: validateUsername,

                      onSaved: (String value){
                      appt=value;  
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
                      hintText: 'Size in sqft.',
                      ),
                      keyboardType: TextInputType.number,
                      validator: validateUsername,

                      onSaved: (String value){
                      size=value;  
                    },
                    ),
                  ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(18,10,0,20),
                child: Container(
                width: 300.0,
                height: 100,
                decoration: BoxDecoration(
                  color: HexColor('#F0F0F0'),
                  borderRadius: new BorderRadius.circular(13.0),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5, top: 5),
                    child: TextFormField(
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Property Description',
                
                      ),
                      validator: validateUsername,
                      onSaved: (String value){
                      descr=value;  
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
                      hintText: 'Price',
                      ),
                      keyboardType: TextInputType.number,
                      validator: validateUsername,

                      onSaved: (String value){
                      price=value;  
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
                      hintText: 'Deposit Amount',
                      ),
                      keyboardType: TextInputType.number,
                      validator: validateUsername,
                      onSaved: (String value){
                      dep=value;  
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
                      hintText: 'Electricity Charges',
                      ),
                      keyboardType: TextInputType.number,
                      validator: validateUsername,

                      onSaved: (String value){
                      elec=value;  
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
                      hintText: 'Maintainance Charges',
                      ),
                      keyboardType: TextInputType.number,
                      validator: validateUsername,
                      onSaved: (String value){
                      maint=value;  
                    },
                    ),
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(70,10,0,0),
                child: Row(
                  children: <Widget>[
                    Text('Ac Rooms',style: TextStyle(fontSize: 18,)),
                    Radio(
                      activeColor: HexColor("#071A52"),
                      value: male,
                      groupValue: ac,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          ac=value;
                        });
                      },
                    ),
                    Text('Available',style: TextStyle(fontSize: 18,)),])),
                    Padding(
                  padding: EdgeInsets.fromLTRB(160,5,0,10),
                child:
                    Row(children:[
                    Radio(
                      activeColor: HexColor("#071A52"),
                      value: female,
                      groupValue: ac,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          ac=value;
                        });
                      },
                    ),
                    Text('Not Available',style: TextStyle(fontSize: 18,)),
                  ],
                ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(70,10,0,20),
                child: Row(
                  children: <Widget>[
                    Text('Upload Property Image',style: TextStyle(fontSize: 18,)),
                    IconButton(icon: Icon(Icons.add_a_photo),color: HexColor("#071A52"), onPressed: (){
                      getImage();
                    })
                ])),
                Padding(padding: EdgeInsets.fromLTRB(0,15,0,40),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: HexColor("#071A52"),)
                ),
                onPressed: (){
                  
                  var x=_sendToServer();
                  if (x==1){
                      uploadPic(context);

                    Navigator.pop(context);}
                    
                },
                color:  HexColor("#071A52"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(45,10,45,8),
                child: Text('Add Property',
                style: TextStyle(fontSize: 20,color: Colors.white),
                
                ),
                ),
                ),
                
                
            ],   
          );} 

void success(context){
  int flag=0;
String fn=basename(_image.path);

if(_image!=null)
  {Map<String,dynamic> newProp = {"ac_rooms":ac,"addr":addr,'appt':appt,'cover_img':fn,'dep_amt':dep,'descr':descr,
  'elec_chrg':elec,'main_chrg':maint,'ow_un':uname,'price':price,'size':size};
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('data');
  collectionReference.add(newProp);
  
flag=1;
   
  
    
  }

}
String validateUsername(String value) {
  if(value.length==0) {
    return "Field is required";
  }
}


_sendToServer(){
  if(_key.currentState.validate()){
    _key.currentState.save();
    success(context);
    return 1;
  }
  else{
    setState(() {
      _validate = true;
    });
    return 0;
  }
}
}

class LoginPage extends State<ListingForm> {
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