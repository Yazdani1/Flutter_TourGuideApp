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

      dispose();
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
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: getRefresh,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext c, index) {
                      var ourData = snapshot.data[index];
                      return Container(
                        height: 350.0,
                        margin: EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(ourData.data['img'],
                                      height: 250.0,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(ourData.data['name'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(ourData.data['address'],
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.deepPurple,

                                  ),
                                ),
                              ),


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




