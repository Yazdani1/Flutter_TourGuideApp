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


      body: CustomScrollView(
        slivers: <Widget>[

          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFF71276f),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.snapshot.data['star']+" Hotel"),
              background: Image.network(widget.snapshot.data['img'],
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverFillRemaining(
            child: SingleChildScrollView(
              
            ),
          ),


        ],

      ),

    );
  }




}







