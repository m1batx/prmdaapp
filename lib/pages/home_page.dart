import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prmda/models/food.dart';
import 'package:prmda/pages/food_details_page.dart';
import 'package:prmda/pages/regstr_page.dart';
import 'package:prmda/services/firestore.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  
  int indexCategory = 0;
  List<int> index = [];
  final FirestoreService _firestoreService = FirestoreService();
  
  
  @override
  void initState() {
    super.initState();
    
    
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
  Widget listFood(List<Food> foods){ //need to explain
    return ListView.builder(
          itemCount: foods.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              key: Key(foods[index].name), 
              child: Card(
                child: ListTile(
                  title: Text(foods[index].name),
                ),
              ));
          },
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
      height: 500,
      child:StreamBuilder(
          stream: _firestoreService.getFoodStream(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            final foods = snapshot.data!.docs;
            return GridView.builder(
              itemCount: foods.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 261,
              ),
              itemBuilder: (context, index) {
                final food = foods[index];
                return GestureDetector(
                  onTap: () {
                    final details = Food(id: food['id'], name: food['name'], ImagePath:food["ImagePath"], price: food["price"], Description: food["Description"], meatType: food["meatType"], category: food["category"]);
                    navigateToFoodDetials(food:details);
                  },
                  child: Container(
                    height: 261,
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
                                  food["ImagePath"],
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                food['name'],
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
                                    food['meatType'],
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.star, color: Colors.amber, size: 18),
                                  const SizedBox(width: 4),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                '${food['price']} ₽',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          top: 12,
                          right: 12,
                          child: Icon(Icons.favorite_border, color: Colors.grey),
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
                );
              },
            );
          },
        ));
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
        leading: const Icon(Icons.menu),
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegstrPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0), // Adjust padding if needed
              child: Icon(Icons.login), // Login icon on the right side
            ),
          ),
        ],
      ),
       //appbar above should be
      body: Column(
        children: [
        //  Container(
        //   decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
        //   margin: const EdgeInsets.symmetric(horizontal: 25),
        //   padding: const EdgeInsets.all(25),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Column(
        //           children: [
        //             Text('заказывайте и на месте забираете', style: GoogleFonts.pacifico(
        //               fontSize: 16,
        //             ),),
                   
        //           const SizedBox(height: 25), // Add space between text and button
        //            Container(
        //             alignment: Alignment.topCenter, // Adjust this to control button position
        //             height: 50, // Control the height as needed
        //             child: MyButton(text: 'Авторизация', onTap: () {Navigator.pushNamed(context,'/login');}),),
                    
        //           ],
        //         ),

        //     ],),

        //  ), // Spacer at the top
        //   const SizedBox(height: 20),
          
          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("ОСНОВНОЕ МЕНЮ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),),
          ),
          const SizedBox(height: 10),
          search(),
          categories(),
          gridFood(),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   margin: const EdgeInsets.only (left: 25, right:  25, bottom: 25 ),
          //   padding: const EdgeInsets.all(20) ,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //     Row(children: [Image.asset('lib/images/angle_1/v pite .jpg', height: 60,),
          //     const SizedBox(width: 20),

          //     Column(children: [
          //       Text("запуска", style: GoogleFonts.acme(fontSize: 16),),

          //       const SizedBox(height: 10,),

          //       const Text('s21.00',)
          //     ],),],), 
              
          //     const Icon(Icons.favorite_outline, color: Colors.grey, size: 28,
          //     ),


          //   ],)
          // )
        ],
      ),
    );
  }
}
