import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/my_cart_tile.dart';
import 'package:prmda/components/my_current_location.dart';
import 'package:prmda/pages/order_page.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/my_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Restraunt>(
      builder: (context, restraunt, child) {
        final userCart = restraunt.cart;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title:  Text(
              "Корзина",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary, 
              ),
              ),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:  Text(
                        'Вы уверены?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary, 
                        ),),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restraunt.clearCart();
                          },
                          child:  Text(
                            "Да",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary, 
                            ),),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child:  Text(
                            "Нет", 
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary
                            )
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon:  Icon(Icons.delete, color: Theme.of(context).colorScheme.inversePrimary,),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    MyCurrentLocation(selectedAddress: restraunt.address,),
                    userCart.isEmpty
                        ?  Expanded(
                            child: Center(
                              child: Text(
                                "Корзина пуста", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )
                              ),
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
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                        onTap: ()=>_launchURL('https://eda.yandex.ru/spb/r/piramida'),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: Text('Заказать из Yandex',
                                style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                ),
                              ),
                          ),
                      ),),
              Padding(
                padding: const EdgeInsets.all(10),
                child: MyButton(
                      onTap: () {
                        if (userCart.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              title:  Text(
                                "Корзина пуста",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
                              content: SizedBox(
                                height: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ок", 
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.inversePrimary
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (restraunt.address.contains("Адрес не выбран")){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              title:  Text("Адрес не выбран", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
                              content: SizedBox(
                                height: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child:  Text("Ок", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }else if (FirebaseAuth.instance.currentUser==null){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              title: Text("Вы не вошли", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
                              content: SizedBox(
                                height: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ок", 
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.inversePrimary
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        else if (FirebaseAuth.instance.currentUser!.emailVerified==false){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              title: Text("Подтвердите почту", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
                              content: SizedBox(
                                height: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ок", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
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
                              backgroundColor: Theme.of(context).colorScheme.background,
                              title:  Text("Подтверждение заказа", 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )
                              ),
                              content: SizedBox(
                                height: 100,
                                child: Column(
                                  
                                  children: [
                                    Text("Адрес самовывоза: ${restraunt.address}", 
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.inversePrimary
                                      )),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(adress: restraunt.address,)));
                                      },
                                      child: Text("Ок", 
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.inversePrimary
                                      )),
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
                )
            ],
          ),
        );
      },
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}