import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prmda/components/food_tile.dart';
import 'package:prmda/models/food.dart';
import 'package:prmda/pages/food_details_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> index = [];

    List foodmenu = [
    //hits меню
    Food(
      name: "Класически", 
      ImagePath: 'lib/images/angle_1/classic.jpg', 
      rating: "4.9", 
      price: "250",
      Descraption: "Класически desc.."
      ),
    
    Food(
      name: "барбикию соус", 
      ImagePath: 'lib/images/angle_1/BBQ.jpg', 
      rating: "4.9", 
      price: "280",
      Descraption: "барбикию desc.."
      ),
    Food(
      name: "шаверма с грбами", 
      ImagePath: 'lib/images/angle_1/classic with mashroom.jpg', 
      rating: "4.9", 
      price: "280",
      Descraption: "с грбами desc.."
      ), 
    Food(
      name: "Супер спайси", 
      ImagePath: 'lib/images/angle_1/classic hot.jpg', 
      rating: "4.9", 
      price: "280",
      Descraption: "Супер спайси desc.."
      ), 
    
    //Food(name: )
    ] ;

  // navigator to the item pages 
  void navigateToFoodDetials(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsPage( food: foodmenu[index]),),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 244),
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
         Container(
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('заказывайте и на месте забираете', style: GoogleFonts.pacifico(
                      fontSize: 16,
                    ),),
                   
                  const SizedBox(height: 25), // Add space between text and button
                   Container(
                    alignment: Alignment.topCenter, // Adjust this to control button position
                    height: 50, // Control the height as needed
                    child: MyButton(text: 'заргистриватся', onTap: () {Navigator.pushNamed(context,'/login');}),),

                    
                  ],
                )

            ],),

         ), // Spacer at the top
          const SizedBox(height: 20),
          
          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("ОСНОВНОЕ МЕНЮ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),),
          ),
          const SizedBox(height: 10),
//padding commented 
          Expanded(
  child: Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foodmenu.length,
      
      itemBuilder: (context, index) => 
      FoodTile(
          food: foodmenu[index], 
          onTap: () => navigateToFoodDetials(index),
                ),
                
                ),
          ),
          ),
          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only (left: 25, right:  25, bottom: 25 ),
            padding: const EdgeInsets.all(20) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [Image.asset('lib/images/angle_1/v pite .jpg', height: 60,),
              const SizedBox(width: 20),

              Column(children: [
                Text("запуска", style: GoogleFonts.acme(fontSize: 16),),

                const SizedBox(height: 10,),

                const Text('s21.00',)
              ],),],), 
              
              const Icon(Icons.favorite_outline, color: Colors.grey, size: 28,
              ),


            ],)
          )
        ],
      ),
    );
  }
}
