import 'package:flutter/material.dart';
import 'package:prmda/components/my_receipt.dart';

class OrderPage extends StatelessWidget{
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Заказ готовится"),
      ),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }


}