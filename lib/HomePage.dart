import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/PropertyDetails.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import '';
class HomePage extends StatefulWidget {
  final uname;
  HomePage({Key key, @required this.uname}) : super(key: key);
  _HomePageState createState() => _HomePageState(uname: '$uname');
}

class _HomePageState extends State<HomePage> {

  final uname;
  _HomePageState({ @required this.uname}) ;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',backgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          
          elevation: 0,
        title:  Padding(
                  padding: EdgeInsets.fromLTRB(20,10,0,0),
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
                        suffixIcon: Icon(Icons.search, color: Colors.black,),
                    border: InputBorder.none,
                    hintText: 'Search',
                    ),
                  ),
                ),
                ),
                ),
                
      actions: <Widget>[
        Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: IconButton(
            icon: Icon(Icons.filter_alt,color: HexColor('#071A52'),),
            onPressed: () {

            },
          ),
    ),
          
        ],
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    
                    child: homeUI(uname,context),
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}
Future getPosts() async{
  var firestore = FirebaseFirestore.instance;
  QuerySnapshot qn = await firestore.collection("data").get();
  return qn.docs;
}
Widget homeUI(uname,context) {
  return Column(             
            children: <Widget>[
                            Align(
                    alignment: Alignment.centerLeft,
                    child: 
                 Container(padding: EdgeInsets.fromLTRB(20,15,15,5),
                    
                    child: Text("Welcome $uname", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                    ),
                    ),
                            ),
                 Container(height: MediaQuery.of(context).size.height,
                   child: 
                   Column( 
                     mainAxisSize: MainAxisSize.min,
                    children:[
                      FutureBuilder(
                     future: getPosts(),
                     builder: (_,snapshot){
                    if (snapshot.connectionState==ConnectionState.waiting)
                    {
                      return Center(
                        child: Text("Loading..."),
                      );
                    }
                    else{
                      return Expanded(
                        // height:1000,
                      child:ListView.builder(itemCount: snapshot.data.length,itemBuilder: (_,index)
                      { print(snapshot.data[index]);
                      // File _file = File('downloads/post.jpg');
                      // final ref = FirebaseStorage.instance.ref().child(snapshot.data[index]["cover_img"]);
// no need of the file extension, the name will do fine.
              // var durl = ref.getDownloadURL() as String;
              //           print(durl); 
                      // Reference _postsReference = FirebaseStorage.instance.ref().child(snapshot.data["cover_img"]);
                      // DownloadTask _downloadTask = _postsReference.writeToFile(_file);
                        return propCard(snapshot.data[index]["addr"],snapshot.data[index]["size"],snapshot.data[index]["price"],snapshot.data[index]["appt"],snapshot.data[index]["cover_img"],context,snapshot.data[index]);
                      }));
                    }
                   }),  
                      
                    
                    ],
                   ),
                 ),
            ]
          );
   }
Widget propCard(addr,size,price,apt,_image,context,snapshot){
return Padding(
                     padding: EdgeInsets.all(15.0),
                     child: Card(
                       clipBehavior: Clip.antiAlias,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => PropertyDetails(dat: snapshot)));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  
                                  Padding(padding: EdgeInsets.fromLTRB(0,10,10,0),
                                  child: Icon(Icons.favorite,color: HexColor('#FF304F'), size: 35,) ,
                                  ),
                                  Ink.image(
                                    height:170,
                                    alignment: Alignment.topCenter,
                                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/rent-cafe.appspot.com/o/"+"$_image"+"?alt=media&token=0db2f382-4b50-438a-ac20-feec7ddcf032"),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(15,10,15,10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("$addr", 
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: HexColor("#575151")),
                                    ),
                                    Text("$apt Apartment", 
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: HexColor("#575151")),
                                    ),  
                                  ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top:10),
                                  child: Row(
                                    children: [ Text("Starts From", 
                                      style: TextStyle(fontSize: 12,color: HexColor("#575151")),
                                    ),
                                  ],
                                  )
                                  ),
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("₹ $price/-", 
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                                    ),
                                    Text("$size sqft.", 
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                                    ), 
                                  ],
                                  ),
                                ]
                              ),
                              ),  
                            ],
                          ),
                        ),
                     ),
                   );
                   }
 