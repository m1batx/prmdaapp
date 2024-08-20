import 'package:flutter/material.dart';
import 'package:prmda/restraunt.dart';
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
              Text("data"),
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    return ListTile(
                    title: Text(cartItem.food.name),
                  );
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

