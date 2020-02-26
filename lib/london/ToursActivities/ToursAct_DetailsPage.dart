import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


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
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text(widget.snapshot.data['title'][0],
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                SizedBox(width: 6.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Text(widget.snapshot.data['title'],
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),//end first row data
                          Container(
                            child: InkWell(
                                child: Icon(Icons.more_horiz),
                              onTap: (){
                                  shoCuportionDialog(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(widget.snapshot.data['des']),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
      ],
    )
    ,

    );
  }

  shoCuportionDialog(BuildContext context){

    showCupertinoModalPopup(
        context: context,
        builder: (context){

          return CupertinoActionSheet(
            cancelButton: new CupertinoActionSheetAction(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: new Text("Cancel")
            ),
            actions: <Widget>[

              new CupertinoActionSheetAction(
                  onPressed: (){},
                  child: new Text("Share",
                    style: TextStyle(fontSize: 22.0,color: Colors.purple),
                  )
              ),
              new CupertinoActionSheetAction(
                  onPressed: (){},
                  child: new Text("Book a seat",
                    style: TextStyle(fontSize: 22.0,color: Colors.purple),
                  )
              ),


            ],
          );

        }
    );

  }

}





