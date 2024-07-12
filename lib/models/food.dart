class Food {
  String name;
  String ImagePath;
  String rating;
  String price;
  String Descraption;
 
  //todo price defind 

  Food({  
      required this.name,
      required this.ImagePath,
      required this.rating, 
      required this.price ,
      required this.Descraption
      
      });
  
  String get _name => name;
  String get _ImagePath => ImagePath;
  String get _rating => rating;
  String get _price => price;  
  String get _Descraption => Descraption;
  
}