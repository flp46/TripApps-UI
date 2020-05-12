import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/user_bloc.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_background.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_places_list.dart';


class ProfileTrips extends StatelessWidget {
  @override

  UserBloc userBloc;

  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
      color: Colors.indigo,
    );*/
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState){
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      }
    );
    
  }   
    
    Widget showProfileData(AsyncSnapshot snapshot){
      if (!snapshot.hasData || snapshot.hasError){
        return Stack(
          children: <Widget>[
            ProfileBackground(),
            ListView(
              children: <Widget>[
                Text('No logeado')
              ],
            ),
          ],
        );
      } else {
        print('Logeado');
        var userData = User(
          name: snapshot.data.displayName,
          uid: snapshot.data.uid,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl
        );
        return Stack(
          children: <Widget>[
            ProfileBackground(),
            ListView(
              children: <Widget>[
                ProfileHeader(user: userData),
                ProfilePlacesList(user: userData)
              ]
            )
          ]
        );
      }
    }



}