import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget{
  
  final hintText;
  final TextEditingController controller;
  final IconData iconData;

  TextInputLocation({Key key, this.hintText, this.controller, this.iconData});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          fillColor: Color(0xFFFFFFFF),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0))            
          ) 
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0.0, 7.0)
          )
        ]
      ), 
    );
  }
}