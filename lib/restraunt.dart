

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prmda/models/food.dart';
import 'package:prmda/services/cart_item.dart';
import 'package:collection/collection.dart';

class Restraunt extends ChangeNotifier{
  final List<Food> _menu = [
    Food(
      id: 1,
      name: "Шаверма в лаваше",
      ImagePath: "lib/images/angle_1/classic.jpg",
      price: 250,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.chicken,
      category: FoodCategory.shawarma,
      availableAddons: [
        Addon(name: "Огурцы маринованные", price: 50),
        Addon(name: "Сыр 'Чеддер'", price: 75),
        Addon(name: "Острый соус по египетски", price: 35),
        Addon(name: "Халапеньо", price: 35),
        Addon(name: "Кетчуп", price: 50),
        Addon(name: "Больше чесночного соуса", price: 0),
        Addon(name: "Картофель фри", price: 65),
        Addon(name: "Барбекью соус", price: 50),
        Addon(name: "Марковь по корейски", price: 65),
        Addon(name: "Гриб", price: 50)
      ]
      ),
    Food(
      id: 2,
      name: "Шаверма с сыром и грибами",
      ImagePath: "lib/images/angle_1/v pite with mashroom & cheese.jpg",
      price: 300,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, сыр и грибы",
      meatType: MeatType.chicken,
      category: FoodCategory.shawarma,
      availableAddons: [
        Addon(name: "Огурцы маринованные", price: 50),
        Addon(name: "Сыр 'Чеддер'", price: 75),
        Addon(name: "Острый соус по египетски", price: 35),
        Addon(name: "Халапеньо", price: 35),
        Addon(name: "Кетчуп", price: 50),
        Addon(name: "Больше чесночного соуса", price: 0),
        Addon(name: "Картофель фри", price: 65),
        Addon(name: "Барбекью соус", price: 50),
        Addon(name: "Марковь по корейски", price: 65),
        Addon(name: "Гриб", price: 50)
      ]
      ),
    Food(
      id: 3,
      name: "Шаверма терияки",
      ImagePath: "lib/images/angle_1/BBQ.jpg",
      price: 280,
      Description: "Курица, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, терияки-соус",
      meatType: MeatType.chicken,
      category: FoodCategory.shawarma,
      availableAddons: [
        Addon(name: "Огурцы маринованные", price: 50),
        Addon(name: "Сыр 'Чеддер'", price: 75),
        Addon(name: "Острый соус по египетски", price: 35),
        Addon(name: "Халапеньо", price: 35),
        Addon(name: "Кетчуп", price: 50),
        Addon(name: "Больше чесночного соуса", price: 0),
        Addon(name: "Картофель фри", price: 65),
        Addon(name: "Барбекью соус", price: 50),
        Addon(name: "Марковь по корейски", price: 65),
        Addon(name: "Гриб", price: 50)
      ]
      ),
    Food(
      id: 4,
      name: "Шаверма Барбекю",
      ImagePath: "lib/images/angle_1/BBQ.jpg",
      price: 280,
      Description: "Курица, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, барбекю-соус",
      meatType: MeatType.chicken,
      category: FoodCategory.shawarma,
      availableAddons: [
        Addon(name: "Огурцы маринованные", price: 50),
        Addon(name: "Сыр 'Чеддер'", price: 75),
        Addon(name: "Острый соус по египетски", price: 35),
        Addon(name: "Халапеньо", price: 35),
        Addon(name: "Кетчуп", price: 50),
        Addon(name: "Больше чесночного соуса", price: 0),
        Addon(name: "Картофель фри", price: 65),
        Addon(name: "Барбекью соус", price: 50),
        Addon(name: "Марковь по корейски", price: 65),
        Addon(name: "Гриб", price: 50)
      ]
      ), 
    Food(
      id: 5,
      name: "Шаверма с картошкой",
      ImagePath: "lib/images/angle_1/classic with kartoshka.jpg",
      price: 280,
      Description: "Курица, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, картошка и морковь по-корейски",
      meatType: MeatType.chicken,
      category: FoodCategory.shawarma,
      availableAddons: [
        Addon(name: "Огурцы маринованные", price: 50),
        Addon(name: "Сыр 'Чеддер'", price: 75),
        Addon(name: "Острый соус по египетски", price: 35),
        Addon(name: "Халапеньо", price: 35),
        Addon(name: "Кетчуп", price: 50),
        Addon(name: "Больше чесночного соуса", price: 0),
        Addon(name: "Картофель фри", price: 65),
        Addon(name: "Барбекью соус", price: 50),
        Addon(name: "Марковь по корейски", price: 65),
        Addon(name: "Гриб", price: 50)
      ]
      ),
    Food(
      id: 6,
      name: "Шаверма с креветками",
      ImagePath: "lib/images/angle_1/shrimp.jpg",
      price: 350,
      Description: "Креветки в панировке, помидоры, пекинская капуста, солёные огурцы, лук красный, морковь по-корейски, чесночный соус и цезарь-соус",
      meatType: MeatType.fish,
      category: FoodCategory.shawarma,
      availableAddons: [
        Addon(name: "Огурцы маринованные", price: 50),
        Addon(name: "Сыр 'Чеддер'", price: 75),
        Addon(name: "Острый соус по египетски", price: 35),
        Addon(name: "Халапеньо", price: 35),
        Addon(name: "Кетчуп", price: 50),
        Addon(name: "Больше чесночного соуса", price: 0),
        Addon(name: "Картофель фри", price: 65),
        Addon(name: "Барбекью соус", price: 50),
        Addon(name: "Марковь по корейски", price: 65),
        Addon(name: "Гриб", price: 50)
      ]
      ),
  ];

  //GETTER
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;


  
  final List<CartItem> _cart = [];
  //add to Cart
  void addToCart(Food food, List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      bool isSameFood = item.food == food;
      bool isSameAddons = 
        const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    if (cartItem != null){
      cartItem.quantity++;
    }else{
      _cart.add(
        CartItem(
          food: food, 
          selectedAddons: selectedAddons
          )
      );
    }
    notifyListeners();
  }

  //remove from Cart

  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex!=-1){
      if (_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }


  //total price of cart

  int getTotalPrice(){
    int total = 0;

    for (CartItem cartItem in _cart){
      int itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal+=addon.price;
      }

      total+= itemTotal*cartItem.quantity;
    }
    return total;
  }


  //get total number of items in cart

  int getTotalItemCount(){
    int totalItemCount = 0;

    for (CartItem cartItem in _cart){
      totalItemCount+=cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart

  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Чек по вашему заказу");
    receipt.writeln();

    String formattedDate = 
      DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("     Добавки: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Общее колличество: ${getTotalItemCount()}");
    receipt.writeln("Сумма: ${_formatPrice(getTotalPrice())}");
    return receipt.toString();
  }

  String _formatPrice(int price){
    return '${price.toString()} ₽';
  }
  String _formatAddons(List<Addon> addons){
    return addons
      .map((addon)=> '${addon.name} (${_formatPrice(addon.price)})')
      .join(", ");
  }
}