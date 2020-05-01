import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class Place {
  final String uid;
  final String name;
  final String description;
  final String urlImage;
  final User userOwner;
  int likes;
  

  Place({Key key, 
    this.uid,
    this.name, 
    this.description, 
    this.urlImage, 
    this.userOwner,
    this.likes
  });
}