
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get user
    final CollectionReference users= 
      FirebaseFirestore.instance.collection("users");
  //create user
    Future<void> addUser(String email, String password){
      return users.add({
        "email":email,
        "password":password,
      });
    }
  //update user

  //delete user 
}