import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


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


      body: SlidingUpPanel(

        panel: _panel_Doctorlist(),
        parallaxEnabled: true,
        parallaxOffset: .5,
        collapsed: _floatingCollapsed(),

        body: CustomScrollView(
          slivers: <Widget>[

            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              backgroundColor: Color(0xFF71276f),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.snapshot.data['star'] + " Hotel"),
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

                child: Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(widget.snapshot.data['title'],
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(widget.snapshot.data['location'],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text("\$" + widget.snapshot.data['price'],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(widget.snapshot.data['des'],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),


              ),
            ),


          ],

        ),


      ),


    );
  }

  Widget _panel_Doctorlist() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              width: 50,
              height: 2,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                  top: 20.0, left: 5.0, right: 5.0, bottom: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(widget.snapshot.data['img2'],
                  height: 250.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.cover,
                ),
              ),

            ),

            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    child: Text("Price for each night:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  Container(
                    child: Text("\$"+widget.snapshot.data['price']+"\+5\%VAT",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xFF71276f)
              ),
              child: Center(
                child: Text("Book Hotel",

                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.white
                ),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }

  Widget _floatingCollapsed() {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepOrange[400],
            Colors.deepOrange[900],
            Colors.green[900],
            Colors.pink[400],
          ],
        ),
      ),
//      decoration: BoxDecoration(
//        color: Colors.green,
//        borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
//      ),
      child: Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Text(
              "Hotel List",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),

          ],
        ),
      ),
    );
  }

}







