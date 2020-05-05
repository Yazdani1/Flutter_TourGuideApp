import 'dart:async';

import 'package:flutter/material.dart';
import 'Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(Duration(seconds: 6),()=>Navigator.of(context).push(new MaterialPageRoute(builder: (con)=>Home())));

    super.initState();
  }
  String img1 = "https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img2 = "https://images.pexels.com/photos/2034335/pexels-photo-2034335.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img3 = "https://images.pexels.com/photos/1579253/pexels-photo-1579253.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  String img4 = "https://images.pexels.com/photos/261169/pexels-photo-261169.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF71276f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  child: ClipOval(
                    child: Image.network(img1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 10.0,),

                Container(
                  height: 100.0,
                  width: 100.0,
                  child: ClipOval(
                    child: Image.network(img2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 10.0,),

                Container(
                  height: 100.0,
                  width: 100.0,
                  child: ClipOval(
                    child: Image.network(img3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 20.0,),

          Container(
            child: Text("Tour Planning App",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),

            ),
          ),

          SizedBox(height: 10.0,),
          Container(
            child: Text("Loading....",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),

            ),
          ),
        ],
      ),
    );
  }
}




