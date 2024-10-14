import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:prmda/restraunt.dart';

class OrderManagementPage extends StatefulWidget{
  const OrderManagementPage({super.key});

  @override
  State<StatefulWidget> createState() =>_OrderManagementPageState();

}
class _OrderManagementPageState extends State<OrderManagementPage> {

  final User? currentUser = FirebaseAuth.instance.currentUser;
  Future<String> getPhone(String uid) async {
  // Use get() instead of snapshots() to fetch the data one time
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
      .collection('Users')
      .where('uid', isEqualTo: uid)
      .limit(1)
      .get();

  // Check if the query returned any documents
  if (querySnapshot.docs.isEmpty) {
    throw Exception("No user found with the provided UID");
  } else {
    // Access the first document in the query result
    Map<String, dynamic> data = querySnapshot.docs.first.data();
    return data['phone'];  // Return the 'phone' field
  }
}
  
  Future<void> updateOrderStatus(String documentId, OrderStatus newStatus) async {
    final DocumentReference docRef = FirebaseFirestore.instance.collection('orders').doc(documentId); 
    
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        docRef.update({
          'order_status': newStatus.toString(),
        }).then((value) {
          print('Order status updated successfully');
        }).catchError((error) {
          print('Failed to update order status: $error');
        });
      } else {
        print('Document does not exist. Creating a new document.');
        docRef.set({
          'order_status': 'OrderStatus.${newStatus.toString().split('.').last}',
        }).then((value) {
          print('New document created successfully');
        }).catchError((error) {
          print('Failed to create new document: $error');
        });
      }
    }).catchError((error) {
      print('Failed to get document: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Управление заказами"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('orders').orderBy('order_id', descending: false).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Ошибка: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('Заказов нет'));
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      String status = data['order_status'].toString().replaceFirst('OrderStatus.', "");
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Номер заказа: ${data['order_id']}'),
                                subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Дата: ${data['date']}'),
                                  Text('Пункт: ${data['location']}'),
                                  Text('Статус: ${OrderStatusToString(OrderStatus.values.byName(status))}'),
                                  Text('Сумма: ${data['total_amount']} ₽'),
                                  Text('Колличество: ${data['total_count']}'),
                                  const Text('Товары:'),
                                  ...(data['items'] as List).map((item) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('- ${item['food_name']}'),
                                        ...(item['selceted_addons'] as List).map((addons) {
                                          return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [ 
                                        Text('- - ${addons['addon_name']}')
                                        ]);
                                        }),
                                      ],
                                    );
                                  }),
                                  const SizedBox(height: 15,),
                                  FutureBuilder<String>(
                                    future: getPhone(data['user_id']), // Fetch phone number based on the user's email
                                    builder: (context, phoneSnapshot) {
                                      if (phoneSnapshot.connectionState == ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      }
                                      if (phoneSnapshot.hasError) {
                                        return Text('Ошибка получения номера: ${phoneSnapshot.error}');
                                      }
                                      String userPhone = phoneSnapshot.data ?? 'Нет номера';
                                      return Text(userPhone);
                                    }),
                                  //I need to show up phone number here
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyButton(text: "Готовится", onTap: (){
                                        updateOrderStatus(data['order_id'].toString(),OrderStatus.cooking);
                                      }),
                                      MyButton(text: "Готово", onTap: (){
                                        updateOrderStatus(data['order_id'].toString(),OrderStatus.done);
                                      }),
                                      
                                    ]),
                                    // Container(
                                    //   child: MyButton(text: "Связаться", onTap: (){
                                          
                                    //   }),
                                    // ),
                                  const SizedBox(height: 10,),
                                  MyButton(text: "Отмена", onTap: (){
                                        updateOrderStatus(data['order_id'].toString(),OrderStatus.declined);
                                      }),
                                ])
                              ),
                            ],
                          ),
                        ),
                      );
                     
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}