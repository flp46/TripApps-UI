import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/user_bloc.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'profile_place.dart';
import 'package:platzi_trips_app/Place/model/place.dart';


class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;
  User user;

  ProfilePlacesList({Key key, this.user});

  
  Place place =  Place(
    name: 'Knuckles Mountains Range', 
    description: 'Hiking. Water fall hunting. Natural bath', 
    urlImage: 'https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80', 
    likes: 1
  );

  
  Place place2 = Place(
    name: 'Mountains', 
    description: 'Hiking. Water fall hunting. Natural bath', 
    urlImage: 'https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80', 
    likes: 1
  );

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of(context);
    
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.myPlacesList(user.uid),
        builder: (context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              print('Quede en none');
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              print('Quede en waiting');
              return CircularProgressIndicator();
            case ConnectionState.active:
              return Column(
                children: userBloc.buildPlaces(snapshot.data.documents)
              );
            case ConnectionState.done:
              return Column(
                children: userBloc.buildPlaces(snapshot.data.documents)
              );
            default:
              return Column(
                children: userBloc.buildPlaces(snapshot.data.documents)
              );
          }
        }
      )
      
      
      
      
      // Column(
      //   children: <Widget>[
      //     ProfilePlace(place),
      //     ProfilePlace(place2),
      //   ],
      // ),
    );
  }

}