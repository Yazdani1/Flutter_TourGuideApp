import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class See extends StatefulWidget {
  @override
  _SeeState createState() => new _SeeState();
}

class _SeeState extends State<See> {

  Future getPlaces()async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("seePlaces").getDocuments();
    return snapshot.documents;
  }
  Future getRefresh()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getPlaces();
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: AppBar(
        title: Text("Tourist Places"),
        backgroundColor: Colors.amber,
      ),

      body: FutureBuilder(
         future: getPlaces(),
        builder: (BuildContext context,snapshot){
           if(snapshot.connectionState == ConnectionState.waiting){
             return Center(
               child: CircularProgressIndicator(),
             );
           }else{
             return RefreshIndicator(
               onRefresh: getRefresh,
               child: GridView.builder(
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                   itemBuilder: (BuildContext c,index){
                     return Container(

                     );

                   }
               ),
             );
           }
        }
      ),

    );
  }
}




