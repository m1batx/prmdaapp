import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final CollectionReference orders = 
  FirebaseFirestore.instance.collection("orders");
  
  //get food
  Future<void> saveOrderToDatabase(Map<String, Object> orderData) async{
    await orders.add(orderData);
  }

  Future<int> getLastOrderId() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('orders')
          .orderBy('order_id', descending: true)
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isNotEmpty) {
        int lastOrderId = querySnapshot.docs.first['order_id'];
        return  lastOrderId+1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }
}
