import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prmda/pages/home_page.dart';
import 'package:prmda/pages/login_page.dart';
import 'package:prmda/pages/regstr_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    
    return const Placeholder();
  }
  CurvedNavigationBar navigateMenu(){
    return CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 248, 246, 244),
        color: Colors.red,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index){
          if (index==0) Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()),);
          if (index==1) Navigator.push(context,MaterialPageRoute(builder: (context) => const CartPage()),);
          if (index==2) Navigator.push(context,MaterialPageRoute(builder: (context) => const RegstrPage()),);
          if (index==3) Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()),);
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
            ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
          )

        ],);
  }
}




