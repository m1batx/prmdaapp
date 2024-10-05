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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.red,
              width: 2.0, // Adjust the width as needed
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical:  10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical:  10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      cartItem.food.ImagePath, 
                      height: 70, 
                      width: 100,),
                  ),
                  const SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.food.name,
                      softWrap: true,style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary
                      )),
                      Text("${cartItem.food.price} ₽",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary
                      )),
                      QuantitySelector(
                    quantity: cartItem.quantity, 
                    food: cartItem.food, 
                    onIncrement: (){
                      restraunt.addToCart(
                        cartItem.food, cartItem.selectedAddons
                      );
                      
                    }, 
                    onDecrement: (){
                      restraunt.removeFromCart(cartItem);
                    })
                    ],
                  ),
                  
                ],
              ),
            ),
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 :60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, bottom: 10,right: 10),
                  children: cartItem.selectedAddons
                    .map(
                      (addon)=>Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          backgroundColor:  Theme.of(context).colorScheme.background,
                          label: Row(
                            children: [
                              Text(addon.name,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary
                              )),

                              Text(' (${addon.price} ₽)',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                              ))
                            ],
                          ),
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Colors.red,
                            )
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 12,
                          ), 
                          onSelected: (value){}),
                        
                        )
                    ).toList()
                ),
              )
            ],
          ),
        );}
      );
  }

  

}
