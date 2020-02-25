import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ToursActivitiesDetails extends StatefulWidget {

  DocumentSnapshot snapshot;

  ToursActivitiesDetails(this.snapshot);

  @override
  _ToursActivitiesDetailsState createState() =>
      new _ToursActivitiesDetailsState();
}

class _ToursActivitiesDetailsState extends State<ToursActivitiesDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[

        SliverAppBar(
        expandedHeight: 250.0,
        floating: false,
        pinned: true,
        backgroundColor: Colors.deepOrange,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(widget.snapshot.data['days']+" Trip"),

          background: Image.network(widget.snapshot.data['img'],
            width: MediaQuery
                .of(context)
                .size
                .width,
            fit: BoxFit.cover,
          ),
        ),
      ), //end silver app bar widget here

      SliverFillRemaining(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                  
                ),//end first row data

                Container(

                )

              ],
            ),
          ),
        ),
      );

      ],
    )
    ,

    );
  }
}





