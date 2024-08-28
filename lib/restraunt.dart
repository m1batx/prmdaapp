

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
      Food(
      id: 7,
      name: "Шаверма c креветками на тарелке",
      ImagePath: "lib/images/angle_2/shrimp na tarelki 2.jpg",
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
      ImagePath: "/lib/images/angle_2/v pite 2 .jpg",
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
      ImagePath: "lib/images/angle_2/classic with mashroom 2.jpg",
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
      ImagePath: "lib/images/angle_2/Dvainaya 2.jpg",
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
      ImagePath: "lib/images/angle_2/classic hot  na tarelki 2.jpg",
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
      ImagePath: "lib/images/angle_2/classic hot  na tarelki 2.jpg",
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
      ImagePath: "lib/images/angle_2/egeptskaya 2.jpg",
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
      ImagePath: "/lib/images/angle_2/v pite 2 .jpg",
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
      ImagePath: "lib/images/angle_2/Cirni lavash 2.jpg",
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
      ImagePath: "lib/images/angle_2/classic hot 2.jpg",
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
      ImagePath: "lib/images/angle_2/classic hot 2.jpg",
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
      ImagePath: "lib/images/angle_2/hotdog 2.jpg",
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
      ImagePath: "lib/images/angle_2/hotdog 2.jpg",
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
      ImagePath: "lib/images/angle_2/govyadina 2.jpg",
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
      ImagePath: "lib/images/angle_2/govyadina na tarelki 2.jpg",
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
      ImagePath: "lib/images/angle_2/Dvainaya 2.jpg",
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
      ImagePath: "lib/images.burger.ches burg.png",
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
      ImagePath: "lib/images/burger/doub.png",
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
      ImagePath: "lib/images/angle_2/falafel v pite 2 .jpg",
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
      ImagePath: "lib/images/angle_2/falafel 2.jpg",
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
      ImagePath: "lib/images/angle_2/falafel na tarelki 2.jpg",
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