import 'package:flutter/material.dart';
import 'package:prmda/models/food.dart';


class QuantitySelector extends StatelessWidget{
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  
  
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
    });
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(Icons.remove,size: 20,
            color: Colors.red,
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child:Center(
                child: Text(
                  quantity.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  )
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncrement ,
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.red,
            )
          ),
        ],
      ),
    );
  }



}