import 'dart:core';
import 'dart:core' as core;

class Food {
  int id;
  String name;
  String ImagePath;
  int price;
  String Description;
  MeatType meatType;
  List<Addon> availableAddons;
  FoodCategory category;
 
  //todo price defind 

  Food({ 
      required this.id, 
      required this.name,
      required this.ImagePath,
      required this.price ,
      required this.Description,
      required this.meatType,
      required this.category,
      required this.availableAddons,
      
      });
  
  String get _name => name;
  String get _ImagePath => ImagePath;
  int get _price => price;  
  String get _Description => Description;
  MeatType get _meatType => meatType;
  FoodCategory get _category => category;
  List<Addon> get _availableAddons =>availableAddons;

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'],
      name: map['name'],
      ImagePath: map['ImagePath'],
      price: map['price'],
      Description: map['Description'],
      meatType: MeatType.values.firstWhere((e) => e.toString().split('.').last == map['meatType']),
      category: FoodCategory.values.firstWhere((e) => e.toString().split('.').last == map['category']),
      availableAddons: List<Addon>.from(map['availableAddons']?.map((x) => Addon.fromMap(x))),
    );
  }

}
enum FoodCategory{
  shawarma,
  burgers,
  hotDogs,
  drinks,
  falafel
}
enum MeatType{
  chicken,
  meat,
  falafel,
  fish
}
String getMeatTypeString(MeatType meatType) {
  switch (meatType) {
    case MeatType.chicken:
      return 'Курица';
    case MeatType.meat:
      return 'Говядина';
    case MeatType.falafel:
      return 'Фалафель';
    case MeatType.fish:
      return 'Креветки';
    default:
      return 'Неизвестно';
  }
}
String getCategoryString(FoodCategory cat) {
  switch (cat) {
    case FoodCategory.burgers:
      return 'Бургеры';
    case FoodCategory.shawarma:
      return 'Шаверма';
    case FoodCategory.falafel:
      return 'Фалафель';
    case FoodCategory.hotDogs:
      return 'Креветки';
    case FoodCategory.drinks:
      return 'Напитки';
    default:
      return 'Неизвестно';
  }
}

class Addon {
  String name;
  int price;

  Addon({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  factory Addon.fromMap(Map<String, dynamic> map) {
    return Addon(
      name: map['name'],
      price: map['price'],
    );
  }
}