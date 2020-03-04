import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => new _SleepState();
}

class _SleepState extends State<Sleep> {

  Future getHotelList() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("london_hotelList")
        .getDocuments();
    return snapshot.documents;
  }
  Future getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getHotelList();
      dispose();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("The Best Hotel List"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
          future: getHotelList(),
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
                    itemBuilder: (BuildContext context, index) {
                      var ourData=snapshot.data[index];
                      return Container(
                        height: 250.0,
                        child: Card(
                          elevation: 10,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(ourData.data['img'],
                                  height: 250.0,
                                    fit: BoxFit.cover,
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




