import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPI {

  final String USERS = 'users';
  final String PLACES = 'places';

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; 


  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlace = _db.collection(PLACES);
    String uid = (await _auth.currentUser()).uid;
    
    await refPlace.add({
      'name': place.name,
      'description': place.description,
      //'urlImage': Todavia no la tengo
      'likes': place.likes,
      'userOwner': '$USERS/$uid' //Este va a ser de tip Reference
    });
  }
}