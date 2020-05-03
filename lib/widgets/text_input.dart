import 'package:flutter/material.dart';

class TextInput extends StatelessWidget{
  
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  int maxLines = 1; //Define el ancho que va a tener el input text !! Pero no lo limita a esa cantidad de lineas

  TextInput({Key key, this.hintText, this.inputType, this.controller, this.maxLines});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9.0))            
          )
        ),
      )
    );
  }
  
}