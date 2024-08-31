import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:prmda/models/food.dart';
import 'package:prmda/pages/food_details_page.dart';
import 'package:prmda/pages/meatCategories_page.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';

import '../helper/helper_functions.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  
  int indexCategory = 0;
  List<int> index = [];
  //final FirestoreService _firestoreService = FirestoreService();
  
  
  @override
  void initState() {
    super.initState();
    
    
  }
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return ListTile(
            title: Text(categoryMenu[index].name),
          );
        });
    }).toList();

  }

  Widget search() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(8, 2, 6, 2),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.red),
                hintText: 'Поиск',
                hintStyle: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
          Material(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const Icon(Icons.bar_chart, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

 
  Widget listFood() {
    return SizedBox(
      height: 280, // Set the height of the slider
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        shrinkWrap: true,
        padding: const EdgeInsets.all(4),
        itemBuilder: (context, index) {
              final food = Restraunt().menu[index];
              return Padding(
                padding: const EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () {
                    final details = Food(
                      id: food.id,
                      name: food.name,
                      ImagePath: food.ImagePath,
                      price: food.price,
                      Description: food.Description,
                      meatType: food.meatType,
                      category: food.category,
                      availableAddons: food.availableAddons,
                    );
                    navigateToFoodDetials(food: details);
                  },
                child: Container(
                  height: 261,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.asset(
                                food.ImagePath,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              food.name,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  getMeatTypeString(food.meatType),
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              '${food.price} ₽',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(onTap: (){
                                displayMessageToUser("Добавлено корзину", context);
                                
                                context.read<Restraunt>().addToCart(food, []);
                                
                              },
                        child: const Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                                child: Icon(Icons.add, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                  ),
                    ],
                  ),
                ),
              ));
        },
        )
        );
      }
    
    Widget categories(){
      return SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    //Navigator.pushNamed(context, '/MeatCategoryPage');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeatCategoriesPage(index: 0)));
                  },
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            'lib/images/icons/chicken.svg',
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        "Курица", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    )
                  ),
                ),
                const SizedBox(width: 15,),
                GestureDetector(
                onTap: (){
                  //Navigator.pushNamed(context, '/MeatCategoryPage');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeatCategoriesPage(index: 1)));
                },
                child:Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'lib/images/icons/falafel.svg',
                          width: 50,
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "Фалафель", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  )
                )
              ),
              const SizedBox(width: 15,),
                GestureDetector(
                onTap: (){
                  //Navigator.pushNamed(context, '/MeatCategoryPage');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeatCategoriesPage(index: 2)));
                },
                child:Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'lib/images/icons/meat.svg',
                          width: 50,
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "Говядина", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  )
                )
              ),
              const SizedBox(width: 15,),
                GestureDetector(
                onTap: (){
                  //Navigator.pushNamed(context, '/MeatCategoryPage');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeatCategoriesPage(index: 3)));
                },
                child:Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'lib/images/icons/fish.svg',
                          width: 50,
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "Креветки", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  )
                )
              ),
              const SizedBox(width: 15,),
                GestureDetector(
                onTap: (){
                  //Navigator.pushNamed(context, '/MeatCategoryPage');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeatCategoriesPage(index: 4)));
                },
                child:Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          'lib/images/icons/drink.svg',
                          width: 50,
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "Напитки", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  )
                )
              ),
              ],
            ),
          ),
        )
      );
    }


  // navigator to the item pages 
  void navigateToFoodDetials({required Food food}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage( food: food),),);
  }

  Widget bannerSlider(){
    final List<String> bannerImages = [
    'lib/images/angle_1/BBQ.jpg',
    'lib/images/angle_1/Cirni lavash with mashroom .jpg',
    'lib/images/angle_1/Cirni lavash.jpg',
  ];
    return Center(
      child: carousel_slider.CarouselSlider(
        options: carousel_slider.CarouselOptions(
          height: 200.0,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          viewportFraction: 0.8,
        ),
        // ignore: avoid_unnecessary_containers
        items: bannerImages.map((item) => Container(
          child: Center(
            child: Image.network(
              item,
              fit: BoxFit.cover,
              width: 1000,
            ),
          ),
        )).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 244),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),// HAVE TO UPDATE
        title: const Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 20.0), // Adjust the padding to move the logo
                child: CircleAvatar(
                  radius: 20, // Adjust the radius as needed
                  backgroundColor: Colors.transparent, // Background color of the CircleAvatar
                  backgroundImage: AssetImage('lib/images/logo.png'), // Local image asset
                ),
              ),
            ),
            Spacer(),
            
            
            ClipRRect(),
            
          ],
        ),
        actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined), // Right side icon
              onPressed: () {
                // Handle the press event
              },
            ),
          ],
      ),
       //appbar above should be
      body: Column(
        children: [
          //const MyCurrentLocation(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: bannerSlider()
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("ХИТ ПРОДАЖ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),),
          ),
          listFood(),
          
          Expanded(
            child: categories())
        ],
      ),
    );
  }
}
