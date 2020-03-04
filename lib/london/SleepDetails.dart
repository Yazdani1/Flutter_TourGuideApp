import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SleepDetails extends StatefulWidget {

  DocumentSnapshot snapshot;
  SleepDetails(this.snapshot);

  @override
  _SleepDetailsState createState() => new _SleepDetailsState();
}

class _SleepDetailsState extends State<SleepDetails> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text(widget.snapshot.data['star']),
        backgroundColor: Colors.deepOrange,
      ),

    );
  }




}







