import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prmda/auth/auth.dart';
import 'package:prmda/pages/cart_page.dart';
import 'package:prmda/pages/categories_page.dart';
import 'package:prmda/pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CategoriesPage(),
    const CartPage(),
    const AuthPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //NotificationServices().showNotification();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Colors.red,
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: _onItemTapped,
        items:  [
          Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.background, 
          ),
          Icon(
            Icons.store,
            color: Theme.of(context).colorScheme.background, 
          ),
          Icon(
            Icons.shopping_cart,
            color: Theme.of(context).colorScheme.background, 
          ),
          Icon(
            Icons.account_circle,
            color: Theme.of(context).colorScheme.background, 
          ),
        ],
      ),
    );
  }
}
