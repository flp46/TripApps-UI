import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';

class User{
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  List<Place> myPlaces;
  List<Place> myFavoritePlaces;

  User({Key key, 
    this.uid,
    this.name, 
    this.email, 
    this.photoURL
  });
}