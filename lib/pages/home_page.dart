import 'package:flutter/material.dart';
import 'package:prmda/models/food.dart';
import 'package:prmda/pages/food_details_page.dart';

import '../restraunt.dart';



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

  Widget categories() {
    List list = ['Шаверма', 'Бургеры', 'Фалафель', 'Хот-доги', 'Напитки'];
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              indexCategory = index;
              setState(() {});
            },

            // top titled category bar 
            child: Container(  
              padding: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 16,
                0,
                index == list.length - 1 ? 16 : 16,
                0,
              ),
              alignment: Alignment.center,
              child: Text(
                list[index],
                style: TextStyle(
                  fontSize: 22,
                  color: indexCategory == index ? Colors.red : Colors.grey,
                  fontWeight: indexCategory == index ? FontWeight.bold : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget gridFood() {
    return SizedBox(
      height: 100, // Set the height of the slider
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
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          child: InkWell(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(Icons.add, color: Colors.white),
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
    


  // navigator to the item pages 
  void navigateToFoodDetials({required Food food}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage( food: food),),);
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
            ClipRRect()
          ],
        ),
      ),
       //appbar above should be
      body: Column(
        children: [
          //const MyCurrentLocation(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("ОСНОВНОЕ МЕНЮ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),),
          ),
          
          
          // search(),
          // categories(),
          Expanded(
            child: gridFood(),
          ),
          Expanded(
            child: gridFood(),
          ),
        ],
      ),
    );
  }
}
