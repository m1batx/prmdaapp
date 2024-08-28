import 'package:flutter/material.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget{
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Спасибо за заказ"),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8)
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restraunt>(
                builder: (context, restraunt, child)=> 
                Text(restraunt.displayCartReceipt())
                ),
            )
          ],
        ),
      ),
    );
  }


}