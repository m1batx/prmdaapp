

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prmda/models/food.dart';
import 'package:prmda/services/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:prmda/services/firestore.dart';

class Restraunt extends ChangeNotifier{
  final List<Food> _menu = [
    Food(
      id: 1,
      name: "Шаверма в лаваше",
      ImagePath: "lib/images/compressed/classic.jpeg",
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
      ImagePath: "lib/images/compressed/v pite with mashroom & cheese.jpeg",
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
      ImagePath: "lib/images/compressed/BBQ.jpeg",
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
      ImagePath: "lib/images/compressed/BBQ.jpeg",
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
      ImagePath: "lib/images/compressed/classic with kartoshka.jpeg",
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
      ImagePath: "lib/images/compressed/shrimp.jpeg",
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
      Food(
      id: 7,
      name: "Шаверма c креветками на тарелке",
      ImagePath: "lib/images/compressed/shrimp na tarelki 2.jpeg",
      price: 550,
      Description: "Креветки в панировке (6 шт.), помидоры, пекинская капуста, солёные огурцы, лук красный, картошка и морковь по-корейски, чесночный соус и цезарь-соус",
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
      Food(
      id: 8,
      name: "Шаверма в пите ",
      ImagePath: "/lib/images/compressed/v pite 2.lpeg",
      price: 220,
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
      id: 9,
      name: "Шаверма в лаваше с грибами",
      ImagePath: "lib/images/compressed/classic with mashroom 2.jpeg",
      price: 280,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, грибы",
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
      id: 10,
      name: "Шаверма в лаваше двойная",
      ImagePath: "lib/images/compressed/Dvainaya 2.jpeg",
      price: 300,
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
      id: 11,
      name: "Двойная шаверма на тарелке",
      ImagePath: "lib/images/compressed/classic hot  na tarelki 2.jpeg",
      price: 400,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, морковь и картофель",
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
      id: 12,
      name: "Шаверма на тарелке",
      ImagePath: "lib/images/compressed/classic hot  na tarelki 2.jpeg",
      price: 350,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, морковь и картофель",
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
      id: 13,
      name: "Египетская шаверма на тарелке",
      ImagePath: "lib/images/compressed/egeptskaya 2.jpeg",
      price: 300,
      Description: " Курица, огурцы, помидоры, пекинская капуста, чесночный соус, гранатовый соус, солёные огурцы, красный лук, морковь и картофель",
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
      id: 14,
      name: "Двойная шаверма в пите",
      ImagePath: "/lib/images/compressed/v pite 2.jpeg",
      price: 270,
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
      id: 14,
      name: "Шаверма в лаваше с сыром",
      ImagePath: "lib/images/compressed/Cirni lavash 2.jpeg",
      price: 280,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, сыр",
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
      id: 15,
      name: "Супер острый в лаваше",
      ImagePath: "lib/images/compressed/classic hot 2.jpeg",
      price: 300,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, острый соус, солёные огурцы и халапеньо",
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
      id: 15,
      name: "Супер острый в лаваше",
      ImagePath: "lib/images/compressed/classic hot 2.jpeg",
      price: 300,
      Description: "Курица, огурцы, помидоры, пекинская капуста, чесночный соус, острый соус, солёные огурцы и халапеньо",
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
      id: 16,
      name: "Хот-дог в лаваше",
      ImagePath: "lib/images/compressed/hotdog 2.jpeg",
      price: 200,
      Description: "Сосиски, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.meat,
      category: FoodCategory.hotDogs,
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
      id: 17,
      name: "Двойной хот-дог в лаваше",
      ImagePath: "lib/images/compressed/hotdog 2.jpeg",
      price: 250,
      Description: "Сосиски, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.meat,
      category: FoodCategory.hotDogs,
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
      id: 18,
      name: "Шаверма в лаваше говядина",
      ImagePath: "lib/images/compressed/govyadina 2.jpeg",
      price: 250,
      Description: "Говядина, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.meat,
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
      id: 19,
      name: "Шаверма на тарелке говядина",
      ImagePath: "lib/images/compressed/govyadina na tarelki 2.jpeg",
      price: 350,
      Description: "Говядина, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный, морковь и картофель",
      meatType: MeatType.meat,
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
      id: 20,
      name: "Говяжья шаверма в лаваше двойная",
      ImagePath: "lib/images/compressed/Dvainaya 2.jpeg",
      price: 350,
      Description: "Говядина, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
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
      Food(
      id: 21,
      name: "Чизбургер",
      ImagePath: "lib/images/compressed/ches burg.jpeg",
      price: 300,
      Description: "бургер, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.meat,
      category: FoodCategory.burgers,
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
      id: 22,
      name: "Двойной чизбургер",
      ImagePath: "lib/images/compressed/doub.jpeg",
      price: 350,
      Description: "бургер, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.meat,
      category: FoodCategory.burgers,
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
      id: 23,
      name: "Фалафель в пите",
      ImagePath: "lib/images/compressed/falafel v pite 2.jpeg",
      price: 200,
      Description: "Фалафель, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.falafel,
      category: FoodCategory.falafel,
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
      id: 24,
      name: "Фалафель в лаваше",
      ImagePath: "lib/images/compressed/falafel 2.jpeg",
      price: 200,
      Description: "Фалафель, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.falafel,
      category: FoodCategory.falafel,
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
      id: 25,
      name: "Фалафель на тарелке",
      ImagePath: "lib/images/compressed/falafel na tarelki 2.jpeg",
      price: 200,
      Description: "Фалафель 4шт, картошка, огурцы, помидоры, пекинская капуста, чесночный соус, солёные огурцы, лук красный",
      meatType: MeatType.falafel,
      category: FoodCategory.falafel,
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
  String get address => _address;
  String _address = "Не выбрано";

  String changeAddress(String addr){
    _address=addr;
    return addr;
  }
  
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
  
  // ignore: non_constant_identifier_names
  Future<Map<String, Object>> generate_order(var it) async {
    int orderID = await FirestoreService().getLastOrderId();
    print("|||||$orderID");
    return {
      //"order_id": "1",
      "order_id": orderID,
      "order_status": OrderStatus.processing.toString(),
      "user_id": FirebaseAuth.instance.currentUser!.uid,
      "location": _address,  //need to add address here
      "date": DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now()),
      "total_count": getTotalItemCount(),
      "total_amount": getTotalPrice(),
      "items": it,
    };
  }
  Future<String> displayCartReceipt() async {
    final receipt = StringBuffer();
    receipt.writeln("Чек по вашему заказу");
    receipt.writeln();

    String formattedDate = 
      DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");
    var it = [];
    for (final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      var ad = [];
      for (Addon addon in cartItem.selectedAddons){
        Map<String, Object> addonItem = {
          "addon_name": addon.name,
          'addon_price': addon.price
        };
        ad.add(addonItem);
      }
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("     Добавки: ${_formatAddons(cartItem.selectedAddons)}");
      }
      Map<String, Object> foodItem = {
        "food_name": cartItem.food.name,
        "quantity": cartItem.quantity,
        'selceted_addons': ad,
      };
      it.add(foodItem);
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Общее колличество: ${getTotalItemCount()}");
    receipt.writeln("Сумма: ${_formatPrice(getTotalPrice())}");
    FirestoreService().saveOrderToDatabase(await generate_order(it));
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
enum OrderStatus{
    done,
    cooking,
    processing,
    declined,
  }
String OrderStatusToString(OrderStatus status){
  switch (status){
    case OrderStatus.done:
      return ("Готово");
    case OrderStatus.cooking:
      return ("Готовится");
    case OrderStatus.processing:
     return "Обрабатывается";
    case OrderStatus.declined:
     return "Отменен";
    default:
      return "Неизвестно";
  }
}
String ClientOrderStatusToString(OrderStatus status){
  switch (status){
    case OrderStatus.done:
      return ("Заказ готов к выдаче");
    case OrderStatus.cooking:
      return ("В процессе");
    case OrderStatus.processing:
     return "Обрабатывается";
    case OrderStatus.declined:
     return "Отменен";
    default:
      return "Неизвестно";
  }
}