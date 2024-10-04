import 'package:flutter/material.dart';
import 'package:prmda/helper/helper_functions.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../restraunt.dart';
import 'food_details_page.dart';


class CategoriesPage extends StatefulWidget{
  const CategoriesPage({super.key});
  
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int indexCategory = 0;
  List<int> index = [];
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
                  fontSize: 20,
                  color: indexCategory == index ? Colors.red : Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: indexCategory == index ? FontWeight.bold : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToFoodDetials({required Food food}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage( food: food),),);
  }

  
  Widget gridFood() {
    // Get the selected category
    FoodCategory selectedCategory = FoodCategory.values[indexCategory];

    // Filter the food items based on the selected category
    List<Food> filteredFoods = Restraunt().menu.where((food) => food.category == selectedCategory).toList();

    return SizedBox(
      //height: 100, // Set the height of the slider
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: filteredFoods.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300.0, // Maximum width of each item
          childAspectRatio: (180 / 261),
        ),
        padding: const EdgeInsets.all(4),
        itemBuilder: (context, index) {
          final food = filteredFoods[index];
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
                  )],
                  ),
                ),
              ));
        }, 
        )
        );
      }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
          children: [
            categories(),
            Expanded(child: gridFood()),
          ],
        ),
    );
  }
}