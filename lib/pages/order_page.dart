import 'package:flutter/material.dart';
import 'package:prmda/components/my_receipt.dart';
import 'package:prmda/restraunt.dart';
import 'package:prmda/services/firestore.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget{
  final String adress;
  const OrderPage({super.key, required this.adress});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    FirestoreService db = FirestoreService();
    String receipt = context.read<Restraunt>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Заказ готовится"),
      ),
      body: Column(
        children: [
          MyReceipt(adress: widget.adress,),
        ],
      ),
    );
  }
}