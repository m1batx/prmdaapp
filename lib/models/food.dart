class Food {
  String name;
  String ImagePath;
  String rating;
  String price;
  //todo price defind 

  Food({  
      required this.name,
      required this.ImagePath,
      required this.rating, 
      required this.price 
      });
  
  String get _name => name;
  String get _ImagePath => ImagePath;
  String get _rating => rating;
  String get _price => price;   
}