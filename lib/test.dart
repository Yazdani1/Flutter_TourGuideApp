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
      
      body: SlidingUpPanel(
        panel: Center(child: Text("This is the main section"),),
        controller: _pc,
        body: _body(),
      ),
      

    );
  }

  Widget _body(){
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Open"),
            onPressed: () => _pc.open(),
          ),
          RaisedButton(
            child: Text("Close"),
            onPressed: () => _pc.close(),
          ),
          RaisedButton(
            child: Text("Show"),
            onPressed: () => _pc.show(),
          ),
          RaisedButton(
            child: Text("Hide"),
            onPressed: () => _pc.hide(),
          ),
        ],
      ),
    );
}}



