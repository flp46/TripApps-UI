import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/user_bloc.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
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

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
                Container(
                  alignment: Alignment.center,
                  child: CardImage(height:250.0, width:350.0, left: 10, pathImage: "assets/img/mountain.jpeg", iconData: Icons.favorite)
                ), //Aqui va la foto
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
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
                ),
                Container(
                  width: 70,
                  child: ButtonPurple(
                    buttonText: 'Submit',
                    onPressed: (){
                      userBloc.updatePlaceData(Place(
                        name: _controllerTitlePlace.text,
                        description: _controllerTitleDescription.text,
                        likes: 0,
                      )).whenComplete((){
                        print('TERMINO');
                        Navigator.pop(context);
                      });
                    }
                      //1. Subir la foto al filestorage
                      //2. Crear el objeto y enviarlo a Cloud Firestore
                    
                  )
                )
              ]
            )
          )
        ],
      ),
    );
  }

}