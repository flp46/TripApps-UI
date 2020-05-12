import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc{

  final authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _firebaseStorageRepository = FirebaseStorageRepository();


  //Caso de uso 1: signIn del usuario
  Future<FirebaseUser> signIn() => authRepository.signInFirebase();
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase; 

  //Caso de uso 3: cierre de sesion del usuario 
  signOut() => authRepository.signOut();

  
  //Caso de uso 3: registro de usuario en DB
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  // Caso de uso 4: registro de place en DB
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  //Caso de uso 5: Carga de archivo en el Firebase Storage
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  Future<StorageUploadTask> uploadImage(String path, File image) => _firebaseStorageRepository.uploadImageFirebaseStorage(path, image);
  
  //Caso de uso 6: Obtener informacion de Firebase de los PLACES
  Stream<QuerySnapshot> placeListStream = Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placeStream => placeListStream;
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesInFirebaseSnapshot) => _cloudFirestoreRepository.buildPlacesFirestore(placesInFirebaseSnapshot);
  Stream<QuerySnapshot> myPlacesList(String uid) =>
    Firestore.instance.collection(CloudFirestoreAPI().PLACES).where(
      'userOwner',
      isEqualTo: Firestore.instance.document('${CloudFirestoreAPI().USERS}/${uid}')
    ).snapshots();
  

  @override
  void dispose() {
    // TODO: implement dispose
  }

}