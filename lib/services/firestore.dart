import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prmda/models/food.dart';

class FirestoreService{

  final CollectionReference food = 
  FirebaseFirestore.instance.collection("food");

  //get food

  Stream<QuerySnapshot> getFoodStream(){
    final foodStream = food.orderBy("id", descending: true).snapshots();

    return foodStream;
  }

  Stream<List<Food>> getFoods() {
  return getFoodStream().map((querySnapshot) {
    return querySnapshot.docs.map((docSnapshot) {
      return Food.fromMap(docSnapshot.data() as Map<String, dynamic>);
    }).toList();
  });
}
}