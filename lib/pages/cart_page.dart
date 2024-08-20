import 'package:flutter/material.dart';
import 'package:prmda/components/my_cart_tile.dart';
import 'package:prmda/restraunt.dart';
import 'package:prmda/services/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    return Consumer<Restraunt>(
      builder: (context, restraunt, child){


        final userCart = restraunt.cart;
        
        
        return Scaffold(
          appBar: AppBar(
            title: const Text("Корзина"),
          ),
          body:Column(
            children: [

              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    return MyCartTile(cartItem: cartItem);
                  }
                  )
                ),
            ],
          ), 
        );
      }
      );
  }
}

