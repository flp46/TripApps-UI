import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) => _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildPlacesFirestore(List<DocumentSnapshot> placesInFirebaseSnapshot) => _cloudFirestoreAPI.buildPlaces(placesInFirebaseSnapshot);

}