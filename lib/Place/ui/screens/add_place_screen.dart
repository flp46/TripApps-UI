import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

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

    double screenWidth = MediaQuery.of(context).size.width;
    final _controllerTitlePlace = TextEditingController();
    final _controllerTitleDescription = TextEditingController(); 
    final _controllerTitleLocation = TextEditingController();    
   
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 250,),
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
              Flexible(
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(top: 45.0, left:20.0, right:10.0),
                  child: TitleHeader(title: 'Add new Place'),
                )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: <Widget>[
                Container(), //Aqui va la foto
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextInput(
                    hintText: 'Title',
                    inputType: null, //Al declararlo en null trae el que viene por defecto
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: 'Description',
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerTitleDescription, 
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child:TextInputLocation(
                    hintText: 'Add Location',
                    iconData: Icons.location_on,
                    controller: _controllerTitleLocation,
                  ) ,
                )
              ]
            )
          )
        ],
      ),
    );
  }

}