import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class UserBloc implements Bloc{

  final authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();


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

  
  @override
  void dispose() {
    // TODO: implement dispose
  }

}