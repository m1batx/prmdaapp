import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/my_cart_tile.dart';
import 'package:prmda/components/my_current_location.dart';
import 'package:prmda/pages/order_page.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String selectedAddress = "Адрес не выбран";

  void onAddressSelected(String adress) {
    setState(() {
      selectedAddress = adress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Restraunt>(
      builder: (context, restraunt, child) {
        final userCart = restraunt.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Корзина"),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Вы уверены?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restraunt.clearCart();
                          },
                          child: const Text("Да"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Нет", style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    MyCurrentLocation(onAddressSelected: onAddressSelected),
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Корзина пуста"),
                            ),
                          )
                        : SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: MyButton(
                  onTap: () {
                    if (userCart.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Корзина пуста"),
                          content: SizedBox(
                            height: 30,
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ок"),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (selectedAddress.contains("Адрес не выбран")){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Адрес не выбран"),
                          content: SizedBox(
                            height: 30,
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ок"),
                              ),
                            ),
                          ),
                        ),
                      );
                    }else if (FirebaseAuth.instance.currentUser==null){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Вы не вошли"),
                          content: SizedBox(
                            height: 30,
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ок"),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                     else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Подтверждение заказа"),
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                Text("Адрес самовывоза: $selectedAddress"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(adress: selectedAddress,)));
                                  },
                                  child: const Text("Ок"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  text: 'Оформить заказ',
                ),
              ),
              
            ],
          ),
        );
      },
    );
  }
}