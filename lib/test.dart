import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class Test extends StatefulWidget {
  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {
  PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Test"),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: RaisedButton(
           child: Text("CLICK"),
          onPressed: (){
             showModalBottomSheet(
                 context: context,
                 builder: (BuildContext context){
                   return Container(
                     height: 1200.0,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                         topRight: Radius.circular(20.0),
                         topLeft: Radius.circular(20.0)
                       )
                     ),
                   );
                 }
             );
          },
        ),
      ),
      

    );
  }


}
