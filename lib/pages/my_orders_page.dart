import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrdersPage extends StatelessWidget {
  final String userId;

  const MyOrdersPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои заказы'),
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
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Заказов нет'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text('Номер заказа: ${data['order_id']}'),
                subtitle: Text('Сумма: \$${data['total_amount']}'),
                trailing: Text('Статус: ${data['order_status']}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}