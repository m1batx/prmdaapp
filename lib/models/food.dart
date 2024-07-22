import 'dart:core';
import 'dart:core' as core;

class Food {
  int id;
  String name;
  String ImagePath;
  int price;
  String Description;
  String meatType;
  String category;
 
  //todo price defind 

  Food({ 
      required this.id, 
      required this.name,
      required this.ImagePath,
      required this.price ,
      required this.Description,
      required this.meatType,
      required this.category
      });
  
  String get _name => name;
  String get _ImagePath => ImagePath;
  int get _price => price;  
  String get _Description => Description;
  String get _meatType => meatType;
  String get _category => category;

  factory Food.fromMap(Map<String, dynamic> data) {
    return Food(
      id: data['id'],
      name: data['name'],
      ImagePath: data['imagePath'],
      price: data['price'],
      Description: data['Description'],
      meatType: data['meatType'],
      category: data['category']
    );
  }

}