import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  Future getAllpost() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("item").getDocuments();
    return snapshot.documents;
  }

  Future<Null> getRefres() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getAllpost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Tourist App"),
        backgroundColor: Colors.deepOrange,
      ),

      body: FutureBuilder(
          future: getAllpost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: getRefres,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var ourdata = snapshot.data[index];
                      return Container(
                        height: 200.0,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Row(
                            children: <Widget>[

                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0,),
                                  child: Image.network(ourdata.data['img'],
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Text(ourdata.data['title'],
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          InkWell(
                                              child: Icon(Icons.more_horiz,size: 20.0,color: Colors.deepOrange,),
                                            onTap: (){
                                              shoCuportionDialog(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(ourdata.data['des'],
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      );
                    }
                ),
              );
            }
          }
      ),
    );
  }
  shoCuportionDialog(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: new Text("First time learning"),
            message: new Text("Cupertion learning things"),
            cancelButton: new CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("Cancel")
            ),
            actions: <Widget>[

              new CupertinoActionSheetAction(
                onPressed: () {},
                child: new Text("First Page",
                  style: TextStyle(fontSize: 22.0, color: Colors.orange),
                ),
              ),

              new CupertinoActionSheetAction(
                  onPressed: () {},
                  child: new Text("Second Page")
              ),
            ],
          );
        }
    );
  }


}


