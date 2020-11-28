import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'ListingForm.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rent_cafe/PropertyDetails.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import '';
class ListingPage extends StatefulWidget {
 final uname;
  ListingPage({Key key, @required this.uname}) : super(key: key);
  _ListingPageState createState() => _ListingPageState(uname: '$uname');
}

class _ListingPageState extends State<ListingPage> {

  final uname;
  _ListingPageState({ @required this.uname}) ;
  Widget build(BuildContext context) {
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
                    child: Text("My Listing", textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: HexColor("#071A52")),
                    ),
                    ),
                ),
                
                
      actions: <Widget>[
        Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: IconButton(
            icon: Icon(Icons.add_circle,size: 30,color: HexColor('#071A52'),),
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ListingForm(uname:uname)));
                  }
        
          ),
    ),
          
        ],
        ),
      body: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(15.0),
                    
                    child: listingUI(uname,context),
                ),
          ),backgroundColor: Colors.white, ),
          
        );
  }
}
Future getPosts(uname) async{
  var firestore = FirebaseFirestore.instance;
  QuerySnapshot qn = await firestore.collection("data").where("ow_un",isEqualTo: uname).get();
  return qn.docs;
}
Widget listingUI(uname,context) {
  return Column(             
            children: <Widget>[
                 Container(
                   height: MediaQuery.of(context).size.height,
                   child: Column(mainAxisSize: MainAxisSize.min, 
                    children:[
                      FutureBuilder(
                     future: getPosts(uname),
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
                          onTap: (){Navigator.push(
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
                                  child: IconButton(icon:Icon(Icons.delete,color: HexColor('#071A52'), size: 35),onPressed: (){
                                     FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                                      await myTransaction.delete(snapshot.reference);
});
                                  },) ,
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
 