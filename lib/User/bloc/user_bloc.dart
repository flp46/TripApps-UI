import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final authRepository = AuthRepository();

  Future<FirebaseUser> signIn() => authRepository.signInFirebase();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase; 

  signOut() => authRepository.signOut();
  
  @override
  void dispose() {
    // TODO: implement dispose
  }

}