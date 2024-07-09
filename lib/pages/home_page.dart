import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prmda/models/food.dart';


class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State <HomePage> createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> {
  List Foodmenu = [
    //кура меню
    Food(name: "Класически", ImagePath: "lib/imgs/angle_1/classic.jpg", rating: "4.9", price: "250"),
    Food(name: "барбикию соус ", ImagePath: "lib/imgs/angle_1/BBQ.jpg", rating: "4.9", price: "280"),
    Food(name: "шаверма с грбами", ImagePath: "lib/imgs/angle_1/classic with mashroom.jpg", rating: "4.9", price: "280"), 
    Food(name: "Супер спайси", ImagePath: "lib/imgs/angle_1/classic hot.jpg", rating: "4.9", price: "280"), 
    

  ] ;


  @override
 


  Widget build(BuildContext context) {
 
    var myButton = MyButton(
                      text: "regstration", 
                      onTap: (){ 
                        Navigator.pushNamed(context, '/regstrationpage');
                      } ,

                    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 214, 214),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        leading: Icon(
          Icons.menu
          ),
           title: Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 60.0), // Adjust the padding to move the logo
            child: CircleAvatar(
              radius: 20, // Adjust the radius as needed
              backgroundColor: Colors.transparent, // Background color of the CircleAvatar
              backgroundImage: AssetImage('lib/imgs/logo.png'), // Local image asset
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
              children: [
                Column(
                  children: [
                    Text('заказывайте и на месте забираете', style: GoogleFonts.pacifico(
                      fontSize: 16,
                    ),),
                    const SizedBox(height: 20,),

                    myButton,
                  ],
                )

            ],),

         ), // Spacer at the top
          
          const SizedBox(height: 20),
          Text('Food menu')
        ],
      ),
      
    );
  }
}



void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

       





    

