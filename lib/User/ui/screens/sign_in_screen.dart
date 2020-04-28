import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/user_bloc.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }
  
}

class _SignInScreen extends State<SignInScreen>{
  
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of(context);
    return _handleSessionStatus();
  }

  Widget _handleSessionStatus(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      }
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body:Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null), // al poner null en este parametro que recibe el height, va a ocupar todo el ancho que pueda
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome \n This is your travel app',
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: 'Login with Gmail', 
                onPressed: (){
                  userBloc.signIn().then((user) => print('El usuario es ${user.displayName}'));
                },
                width: 300.0,
                height: 50.0,
              )
            ]
          ),
        ],
      )
    );
  }

}