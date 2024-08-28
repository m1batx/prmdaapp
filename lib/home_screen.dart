import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prmda/pages/cart_page.dart';
import 'package:prmda/pages/categories_page.dart';
import 'package:prmda/pages/home_page.dart';
import 'package:prmda/pages/user_page.dart';
import 'package:prmda/services/notification_services.dart';

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
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    NotificationServices().showNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.red,
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.store,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
