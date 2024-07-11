import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prmda/components/food_tile.dart';
import 'package:prmda/models/food.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    List foodmenu = [
    //hits меню
    Food(
      name: "Класически", 
      ImagePath: 'lib/images/angle_1/classic.jpg', 
      rating: "4.9", 
      price: "250"
      ),
    
    Food(
      name: "барбикию соус", 
      ImagePath: 'lib/images/angle_1/BBQ.jpg', 
      rating: "4.9", 
      price: "280"
      ),
    Food(
      name: "шаверма сгрбами", 
      ImagePath: 'lib/images/angle_1/classic with mashroom.jpg', 
      rating: "4.9", 
      price: "280"
      ), 
    Food(
      name: "Супер спайси", 
      ImagePath: 'lib/images/angle_1/classic hot.jpg', 
      rating: "4.9", 
      price: "280"
      ), 
    ] ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 253),
      appBar: AppBar( backgroundColor: Colors.transparent, elevation: 0, leading: const Icon(Icons.menu,), title: const Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60.0), // Adjust the padding to move the logo
            child: CircleAvatar(
              radius: 20, // Adjust the radius as needed
              backgroundColor: Colors.transparent, // Background color of the CircleAvatar
              backgroundImage: AssetImage('lib/images/logo.png'), // Local image asset
            ),
          ),
        ),
      ],
    ),
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
                    child: MyButton(text: 'заргистриватся', onTap: () {Navigator.pushNamed(context,'/regstrationpage');}),),

                    
                  ],
                )

            ],),

         ), // Spacer at the top
          const SizedBox(height: 20),
          
          
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Food menu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 25),),
          ),
          const SizedBox(height: 10),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodmenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodmenu[index],),),
          ))
        ],
      ),
    );
  }
}