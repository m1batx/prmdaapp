import 'package:firebase_auth/firebase_auth.dart';

class Authservice {


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }


  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}