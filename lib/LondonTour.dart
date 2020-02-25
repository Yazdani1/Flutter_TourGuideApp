import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';
import 'package:flutter_tourapp/london/ToursActivities/ToursAct_DetailsPage.dart';
import 'package:flutter_tourapp/london/London_Eat.dart';

class CityDetails extends StatefulWidget {


  @override
  _CityDetailsState createState() => new _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {

  Future getTours() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("tours_activities")
        .getDocuments();
    return snapshot.documents;
  }

  Future getMustsee() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("london_must_see")
        .getDocuments();
    return snapshot.documents;
  }

  Future getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getTours();
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: ListView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[

            Container(
              height: 2000.0,
              child: Column(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 40.0),
                    child: SingleChildScrollView(
                      child: Row(
                        children: <Widget>[

                          Container(
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: Icon(Icons.arrow_back, size: 30.0,)
                            ),
                          ),
                          SizedBox(width: 20.0,),

                          Text("London",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),

                  Container(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[

                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(_londonEat());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[

                                      Container(
                                        height: 60.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                            color: Colors.deepPurple
                                        ),
                                        child: Icon(Icons.fastfood),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text("Eat",
                                        style: TextStyle(
                                            fontSize: 20.0
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[

                                    Container(
                                      height: 60.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          color: Colors.amber
                                      ),
                                      child: Icon(Icons.view_agenda),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("See",
                                      style: TextStyle(
                                          fontSize: 20.0
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[

                                    Container(
                                      height: 60.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          color: Colors.red
                                      ),
                                      child: Icon(Icons.home),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("Sleep",
                                      style: TextStyle(
                                          fontSize: 20.0
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[

                                    Container(
                                      height: 60.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          color: Colors.deepOrange
                                      ),
                                      child: Icon(Icons.shop),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("Shop",
                                      style: TextStyle(
                                          fontSize: 20.0
                                      ),
                                    )

                                  ],
                                ),
                              ),


                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //End second container
                  //Start third container
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Tours & Activities",
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          ),
                        ),
                        SizedBox(height: 6.0,),
                        Container(
                          height: 280.0,
                          child: getttours(context),
                        )
                      ],
                    ),
                  ),
                  //end Third container must see container
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Must See",
                              style: TextStyle(
                                  fontSize: 20.0
                              )
                          ),
                        ),

                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          margin: EdgeInsets.all(10.0),
                          child: must_see(context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        )

    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Home(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.ease;

        //var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  Route _londonEat() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LondonEat(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.ease;

        //var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  Route _gettoursactivities(BuildContext context, DocumentSnapshot snap) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ToursActivitiesDetails(snap),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.ease;

        //var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  Widget getttours(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getTours(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                  onRefresh: getRefresh,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, index) {
                        var ourData = snapshot.data[index];
                        return Container(
                          height: 250.0,
                          width: 350.0,
                          child: Stack(
                            children: <Widget>[

                              Container(
                                margin: EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(ourData.data['img'],
                                    height: 200.0,
                                    width: 350.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: 40.0,
                                bottom: 30.0,
                                child: Container(
                                  height: 20.0,
                                  width: 270,
                                  child: Card(
                                    elevation: 20.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(ourData.data['title'],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
                                                child: Text(ourData.data['days'],
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.red
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 20.0),
                                                child: InkWell(
                                                  onTap: (){
                                                    Navigator.of(context).push(_gettoursactivities(context, ourData));
                                                  },
                                                  child: Icon(Icons.arrow_forward,
                                                    size: 30.0,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        );
                      }
                  )
              );
            }
          }
      ),
    );
  }

  Widget must_see(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getMustsee(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()
              );
            } else {
              return RefreshIndicator(
                onRefresh: getRefresh,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) {
                      var ourData = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(ourData.data['img'],
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              flex: 2,
                              child: Text(ourData.data['title'],
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )

                          ],
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


