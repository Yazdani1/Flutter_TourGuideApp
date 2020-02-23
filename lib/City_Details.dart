import 'package:flutter/material.dart';

class CityDetails extends StatefulWidget {
  @override
  _CityDetailsState createState() => new _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Most Items"),
        backgroundColor: Colors.deepOrange,
      ),

    );
  }
}


