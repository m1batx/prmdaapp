import 'package:flutter/material.dart';
import 'package:prmda/components/my_quantity_selector.dart';
import 'package:prmda/services/cart_item.dart';
import 'package:provider/provider.dart';

import '../restraunt.dart';



class MyCartTile extends StatelessWidget{

  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});
  
  @override
  Widget build(BuildContext context) {
    
    return Consumer<Restraunt?>(
      builder: (context, restraunt, child) {
        if (restraunt == null) {
          // Handle the case where restaurant is null (e.g., show error message)
          return const Center(child: Text('Error: Restaurant provider is null'));
        }
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical:  10),
                child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      cartItem.food.ImagePath, 
                      height: 100, 
                      width: 120,),
                  ),
                  const SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name),
                      Text(cartItem.food.price.toString()+" ₽")
                    ],
                  ),
                  // QuantitySelector(
                  //   quantity: cartItem.quantity, 
                  //   food: cartItem.food, 
                  //   onIncrement: (){
                  //     restraunt.addToCart(
                  //       cartItem.food, cartItem.selectedAddons
                  //     );
                  //   }, 
                  //   onDecrement: (){
                  //     restraunt.removeFromCart(cartItem);
                  //   })
                ],
              ),
            ),
              
            ],
          ),
        );}
      );
  }

  

}
