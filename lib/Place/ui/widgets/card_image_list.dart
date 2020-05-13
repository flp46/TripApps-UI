import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/user_bloc.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: userBloc.placeStream,
        builder: (context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
            case ConnectionState.done:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
          }
        }
      ),
    );


  }

    Widget listViewPlaces(List<CardImage> placesCard){
      return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: placesCard,
      );     
    } 
    // ListView(
    //     padding: EdgeInsets.all(25.0),
    //     scrollDirection: Axis.horizontal,
    //     children: <Widget>[

    //     ],
    //   ),

}