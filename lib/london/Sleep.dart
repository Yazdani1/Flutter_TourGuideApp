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
                        height: 200.0,
                        margin: EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 10,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(ourData.data['img'],
                                  height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(ourData.data['title'],
                                        maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 5.0,),

                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(ourData.data['star'],
                                        maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(ourData.data['location'],
                                        maxLines: 1,
                                          style: TextStyle(
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Color(0xFF71276f)
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
}




