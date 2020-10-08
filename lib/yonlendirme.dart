import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Yonlendir extends StatefulWidget {
  String queryParam;
  Yonlendir(this.queryParam);


  @override
  _YonlendirState createState() => _YonlendirState();
}

class _YonlendirState extends State<Yonlendir> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
@override
  void initState() {
  calistir();
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body:
 FutureBuilder<DocumentSnapshot>(
 future:firestore.collection("shorted").doc(widget.queryParam).get()??null,
 builder:
 (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

 if (snapshot.hasError) {
 return Text("Something went wrong");
 }

 if (snapshot.connectionState == ConnectionState.done) {
 Map<String, dynamic> data = snapshot.data.data();
 gonder(data);

 return Center(
   child: Column(
     children: [Text("Full Name: ${data['arda']} ${data['link']}"+widget.queryParam),CircularProgressIndicator()],
   ),
 );
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

    Future.delayed(Duration(seconds: 3),(){
    Navigator.pop(context);
  });
  }

  void gonder([Map<String,dynamic> data]) {
    launch(data['link'],universalLinksOnly: true);

  }
}
