import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class See extends StatefulWidget {
  @override
  _SeeState createState() => new _SeeState();
}

class _SeeState extends State<See> {

  Future getPlaces() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("seePlaces")
        .getDocuments();
    return snapshot.documents;
  }

  Future getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getPlaces();
    });
  }
  final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  final double itemWidth = size.width / 2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Tourist Places"),
        backgroundColor: Colors.amber,
      ),

      body: FutureBuilder(
          future: getPlaces(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: getRefresh,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data.length,
                    childAspectRatio: (itemWidth / itemHeight),
                    itemBuilder: (BuildContext c, index) {
                      var ourData = snapshot.data[index];
                      return Container(
                        child: Card(
                          elevation: 10.0,
                          child: Column(
                            children: <Widget>[

                              Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(ourData.data['img'],
                                    height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: Text(ourData.data['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20.0
                                ),
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
}




