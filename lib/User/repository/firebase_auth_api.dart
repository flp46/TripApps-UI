import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

  //Inicializar las clases FirebaseAuth y GoogleSignIn
  final FirebaseAuth _auth = FirebaseAuth.instance; 
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Ahora puedo usar Firebase _auth para autenticar en mi codigo de Dart
  Future<FirebaseUser> handleSignIn() async { //Como resultado de la autenticacion Firebase retornar un objeto de tipo FirebaseUser, eso es lo que esta prometido que a futuro voy a recibir. Como es a futuro es async
    GoogleSignInAccount googleUser = await _googleSignIn.signIn(); //Levanta el pop-up de google para que se autentique y espera respuesta
    GoogleSignInAuthentication googleAuth = await googleUser.authentication; //Obtiene y guarda el token de autenticacion de google

    //Voy a guardar en la variable de tipo FirebaseUser user, lo que me traiga el metodo de registro 
    //con credenciales de FirebaseAuth. Ese metodo de Firebase signIntWithCredencials me pide que le pase las credenciales,
    //esas las voy a sacar del token que viene en la autenticacion en el paso anterior
    FirebaseUser user = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));

    //Lo que me retorna el futre, sera ese user
    return user;
  }

  signOut() async {
    await _auth.signOut().then((onValue) => print('ya cerre sesion en firebase'));
    _googleSignIn.signOut();
    print('ya cerrer sesion de google');
  }
}