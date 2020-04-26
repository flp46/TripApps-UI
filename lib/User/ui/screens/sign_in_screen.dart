import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return signInGoogleUI();
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