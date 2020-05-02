import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget{
  
  File image;

  AddPlaceScreen({Key key, this.image});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }
  
}

class _AddPlaceScreen extends State<AddPlaceScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, size: 45.0, color: Colors.white),
                    onPressed: (){
                      Navigator.pop(context);
                    } 
                  )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}