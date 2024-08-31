import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final CollectionReference orders = 
  FirebaseFirestore.instance.collection("orders");
  
  //get food
  Future<void> saveOrderToDatabase(String receipt) async{
    await orders.add({
      "date": DateTime.now(),
      "order": receipt,
    }
    );
  }
}