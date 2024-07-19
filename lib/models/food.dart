import 'dart:ffi';
import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';
import 'dart:core' as core;

class Food {
  String name;
  String ImagePath;
  double rating;
  Int price;
  String Description;
  String meatType;
  String category;
 
  //todo price defind 

  Food({  
      required this.name,
      required this.ImagePath,
      required this.rating, 
      required this.price ,
      required this.Description,
      required this.meatType,
      required this.category
      });
  
  String get _name => name;
  String get _ImagePath => ImagePath;
  double get _rating => rating;
  Int get _price => price;  
  String get _Descraption => Description;
  String get _meatType => meatType;
  String get _category => category;
}