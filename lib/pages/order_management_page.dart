import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:prmda/restraunt.dart';
import 'package:prmda/services/firestore.dart';

class OrderManagementPage extends StatefulWidget{
  const OrderManagementPage({super.key});

  @override
  State<StatefulWidget> createState() =>_OrderManagementPageState();

}
class _OrderManagementPageState extends State<OrderManagementPage> {
  
  Future<void> updateOrderStatus(String documentId, OrderStatus newStatus) async {
    final DocumentReference docRef = FirebaseFirestore.instance.collection('orders').doc(documentId);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('order_id', isEqualTo: 2)
          .limit(1)
          .get();
    print(querySnapshot);  
    docRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        docRef.update({
          'order_status': '${newStatus.toString()}',
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
                                        }).toList(),
                                      ],
                                    );
                                  }).toList(),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MyButton(text: "Готовится", onTap: (){
                                        updateOrderStatus(data['order_id'].toString(),OrderStatus.cooking);
                                        print(data);
                                      }),
                                      MyButton(text: "Готово", onTap: (){
                                        updateOrderStatus(data['order_id'].toString(),OrderStatus.done);
                                      }),
                                      MyButton(text: "Отмена", onTap: (){
                                        updateOrderStatus(data['order_id'].toString(),OrderStatus.declined);
                                      }),
                                    ]),
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