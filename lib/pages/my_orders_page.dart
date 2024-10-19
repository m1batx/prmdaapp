import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prmda/restraunt.dart';

class MyOrdersPage extends StatelessWidget {
  final String userId;

  const MyOrdersPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Text('Мои заказы',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('user_id', isEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Заказов нет',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),));
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              String status = data['order_status'].toString().replaceFirst('OrderStatus.',"");
              return ListTile(
                textColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text('Номер заказа: ${data['order_id']}'),
                subtitle: Text('Сумма: ${data['total_amount']} ₽'),
                trailing: Text('Статус: ${ClientOrderStatusToString(OrderStatus.values.byName(status))}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}