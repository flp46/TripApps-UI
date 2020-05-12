import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

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
      'urlImage': place.urlImage,
      'likes': place.likes,
      'userOwner': _db.document("${USERS}/${uid}") //Este va a ser de tip Reference
    }).then((DocumentReference snapshot){
      snapshot.documentID;
      DocumentReference refUser = _db.collection(USERS).document(uid);
      refUser.updateData({
        'myPlaces': FieldValue.arrayUnion([_db.document('${PLACES}/ ${snapshot.documentID}')])
      });
    });
  }

  List<ProfilePlace> buildPlaces (List<DocumentSnapshot> placesInFirebaseSnapshot){
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();

    placesInFirebaseSnapshot.forEach((p){
      profilePlaces.add(ProfilePlace(
        Place(
          name: p.data['name'],
          description: p.data['description'],
          urlImage: p.data['urlImage'],
          likes: p.data['likes']
        )
      ));
    });
    print('$profilePlaces');
    return profilePlaces;
  } //Cierre de metodo buildPlaces
} // Cierre de Clase