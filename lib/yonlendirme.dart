import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

import 'package:urlshortenerweb/main.dart';
import 'package:urlshortenerweb/model.dart';
import 'package:urlshortenerweb/purschase_api.dart';

class Yonlendir extends StatefulWidget {
  String queryParam;
  Yonlendir(this.queryParam);


  @override
  _YonlendirState createState() => _YonlendirState();
}
var budur="arda";
PurschaseApiClient purschaseApiClient = PurschaseApiClient();

class _YonlendirState extends State<Yonlendir> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
@override
  void initState() {

  debugPrint(budur.toString()+"2666666666asdsa6d");
  debugPrint(widget.queryParam +  "55555555");


  calistir();
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body:
 FutureBuilder<Purch>(
 future:purschaseApiClient.getPurschase(),
 builder:
 (BuildContext context, AsyncSnapshot<Purch> snapshot) {

 if (snapshot.hasError) {
 return Text(snapshot.error.toString());
 }

 if (snapshot.connectionState == ConnectionState.done) {
   kontroler(snapshot);
 return Center(child: Column(
   children: [
     Text("Yükleniyor"),
     CircularProgressIndicator()
   ],
 ));

 }

 return Text("loading");
 },
 )



    /*StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('shorted').where("urls").snapshots(),
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        if ( snapshot.hasData ){
          return Text(snapshot.data.toString());

        }
        return Text("");
      },
    ),*/,
 );
  }

  void calistir() {

    Future.delayed(Duration(seconds: 5000),(){
      debugPrint(widget.queryParam +  "55555555");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomeScreen();
      }));
  });
  }

  Future<void> gonder([Map<String,dynamic> data])  {


    html.window.location.assign(data['link']);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
     return HomeScreen();
    }));


  }

  void kontroler(AsyncSnapshot<Purch> snapshot) {
  for(var i=0;i<snapshot.data.shortened.length;i++){
    snapshot.data.shortened[i].originParamater==widget.queryParam.substring(1)?
    git(snapshot,i):print("wrsn");
  }

  }

  git(AsyncSnapshot<Purch> snapshot, int i) {
    html.window.location.assign(    budur=snapshot.data.shortened[i].shortUrl
    );

  }
}
