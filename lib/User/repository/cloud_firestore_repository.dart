import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) => _cloudFirestoreAPI.updatePlaceData(place);

}