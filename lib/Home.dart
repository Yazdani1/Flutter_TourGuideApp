import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'LondonTour.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  String img1 = "https://images.pexels.com/photos/3711348/pexels-photo-3711348.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img2 = "https://images.pexels.com/photos/2161467/pexels-photo-2161467.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img3 = "https://images.pexels.com/photos/3560362/pexels-photo-3560362.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img4 = "https://images.pexels.com/photos/235648/pexels-photo-235648.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img5 = "https://images.pexels.com/photos/1736222/pexels-photo-1736222.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img6 = "https://images.pexels.com/photos/1007657/pexels-photo-1007657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img7 = "https://images.pexels.com/photos/2589011/pexels-photo-2589011.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  Future gettPlaces() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("country_name_place")
        .getDocuments();
    return snapshot.documents;
  }

  Future getRefresh() async {
    Future.delayed(Duration(seconds: 3));
    setState(() {
      gettPlaces();
    });
  }

  Future topPlaces() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("top_ten_places")
        .getDocuments();
    return snapshot.documents;
  }

  List<MaterialColor>_color = [Colors.orange, Colors.blue, Colors.purple, Colors
      .pink, Colors.amber, Colors.red, Colors.green, Colors.brown
  ];
  MaterialColor color;
//  Future getAllpost() async {
//    var firestore = Firestore.instance;
//    QuerySnapshot snapshot = await firestore.collection("item").getDocuments();
//    return snapshot.documents;
//  }

//  Future<Null> getRefres() async {
//    await Future.delayed(Duration(seconds: 3));
//    setState(() {
//      getAllpost();
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //First Container
            Container(
              height: 250.0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 6.0,
                  dotIncreasedColor: Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 10.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  images: [
                    NetworkImage(img1),
                    NetworkImage(img2),
                    NetworkImage(img3),
                    NetworkImage(img4),
                    NetworkImage(img5),
                    NetworkImage(img6),
                    NetworkImage(img7),

                  ],
                ),
              ),
            ),
            //end first container
            //Second Container

            Container(
              height: 250.0,
              margin: EdgeInsets.only(top: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    child: city_tour(context, img7, "London"),
                    onTap: () {
                      Navigator.of(context).push(_createRoute(context));
                    },
                  ),
                  city_tour(context, img6, "Paris"),
                  city_tour(context, img5, "Italy"),
                  city_tour(context, img3, "Vietnam"),

                ],
              ),
            ),
            //Third Container top 10 places
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: <Widget>[
                  topten_places(context)
                ],
              ),
            ),

          ],
        ),
      ),
//      appBar: AppBar(
//        title: Text("Tourist App"),
//        backgroundColor: Colors.deepOrange,
//      ),

//      body: FutureBuilder(
//          future: getAllpost(),
//          builder: (context, snapshot) {
//            if (snapshot.connectionState == ConnectionState.waiting) {
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            } else {
//              return RefreshIndicator(
//                onRefresh: getRefres,
//                child: ListView.builder(
//                    itemCount: snapshot.data.length,
//                    itemBuilder: (context, index) {
//                      var ourdata = snapshot.data[index];
//                      return Container(
//                        height: 200.0,
//                        child: Card(
//                          elevation: 5.0,
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(20.0)
//                          ),
//                          child: Row(
//                            children: <Widget>[
//
//                              Expanded(
//                                flex: 1,
//                                child: ClipRRect(
//                                  borderRadius: BorderRadius.circular(20.0,),
//                                  child: Image.network(ourdata.data['img'],
//                                    height: 200.0,
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                              ),
//                              Expanded(
//                                flex: 2,
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      padding: EdgeInsets.all(15.0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment
//                                            .spaceBetween,
//                                        children: <Widget>[
//                                          Text(ourdata.data['title'],
//                                            maxLines: 2,
//                                            style: TextStyle(
//                                                fontSize: 18.0,
//                                                fontWeight: FontWeight.bold
//                                            ),
//                                          ),
//                                          InkWell(
//                                              child: Icon(Icons.more_horiz,size: 20.0,color: Colors.deepOrange,),
//                                            onTap: (){
//                                              shoCuportionDialog(context);
//                                            },
//                                          )
//                                        ],
//                                      ),
//                                    ),
//
//                                    Container(
//                                      padding: EdgeInsets.all(15.0),
//                                      child: Text(ourdata.data['des'],
//                                        maxLines: 3,
//                                        style: TextStyle(
//                                          fontSize: 18.0,
//                                        ),
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              )
//
//                            ],
//                          ),
//                        ),
//                      );
//                    }
//                ),
//              );
//            }
//          }
//      ),
    );
  }
//  shoCuportionDialog(BuildContext context) {
//    showCupertinoModalPopup(
//        context: context,
//        builder: (context) {
//          return CupertinoActionSheet(
//            title: new Text("First time learning"),
//            message: new Text("Cupertion learning things"),
//            cancelButton: new CupertinoActionSheetAction(
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//                child: new Text("Cancel")
//            ),
//            actions: <Widget>[
//              new CupertinoActionSheetAction(
//                onPressed: () {},
//                child: new Text("First Page",
//                  style: TextStyle(fontSize: 22.0, color: Colors.orange),
//                ),
//              ),
//              new CupertinoActionSheetAction(
//                  onPressed: () {},
//                  child: new Text("Second Page")
//              ),
//            ],
//          );
//        }
//    );
//  }
  Route _createRoute(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CityDetails(),
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

  Widget city_tour(BuildContext context, String img, String name) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10.0),
                child: Image.network(img,
                  height: 200.0,
                  width: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: 160.0,
            left: 20.0,
            bottom: 10.0,
            child: Text(name,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          )


        ],
      ),
    );
  }

  PanelController _pc = new PanelController();

  Widget topten_places(BuildContext context) {
    return Container(
      height: 450.0,
      margin: EdgeInsets.all(5.0),
      child: FutureBuilder(
          future: topPlaces(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: getRefresh,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) {
                      var ourData = snapshot.data[index];
                      color = _color[index % _color.length];
                      return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: EdgeInsets.only(top: 10.0),
                        child: Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[

                                    Container(
                                      child: Row(
                                        children: <Widget>[

                                          Container(
                                            child: CircleAvatar(
                                              child: Text(
                                                  ourData.data['title'][0]),
                                              foregroundColor: Colors.white,
                                              backgroundColor: color,
                                            ),
                                          ),
                                          SizedBox(width: 6.0,),

                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[

                                                Container(
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width / 1.5,
                                                  child: Text(
                                                    ourData.data['title'],
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight: FontWeight
                                                            .bold
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5.0,),
                                                Text(ourData.data['days'],
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.deepOrange
                                                  ),
                                                )

                                              ],
                                            ),
                                          )


                                        ],
                                      ),
                                    ),

                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: InkWell(
                                        onTap: () {
                                          mainBottom(context, ourData.data['title'],
                                              ourData.data['days'],
                                              ourData.data['img'],
                                              ourData.data['des'],

                                          );
                                        },
                                        child: Icon(Icons.more_horiz,
                                          size: 30.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )


                                  ],
                                ),
                              ),

                              SizedBox(height: 5.0,),

                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(ourData.data['img'],
                                    height: 250.0,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.0,),

                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(ourData.data['des'],
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black
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
//bottom sheet
  mainBottom(BuildContext context, String title, String days, String img,
      String des) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {

          return Container(
            height: 600.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)
                ),
            color: Theme.of(context).canvasColor
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)
                    )
                ),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: <Widget>[

                            Container(
                              child: Row(
                                children: <Widget>[

                                  Container(
                                    child: CircleAvatar(
                                      child: Text(
                                          title[0]),
                                      foregroundColor: Colors.white,
                                      backgroundColor: color,
                                    ),
                                  ),
                                  SizedBox(width: 6.0,),

                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[

                                        Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width / 1.5,
                                          child: Text(
                                            title,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight
                                                    .bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(days,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.deepOrange
                                          ),
                                        )

                                      ],
                                    ),
                                  )


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 5.0,),

                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(img,
                            height: 250.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.0,),

                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(des,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

}


