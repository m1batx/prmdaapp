import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food.dart';
class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
        // list view food deatials
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(widget.food.ImagePath,
                  height: 200,),
                  const SizedBox(height: 25),
              
                  Row(children: [
                    Icon(Icons.star,
                    color: Colors.yellow,
                    ),
                    const SizedBox(width: 10),
              
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.acme(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Descraption",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                      ),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.food.Descraption,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 2,
                  )
                  ),
                ],
                ),
            ),
              ),
              Container(
                color: const Color.fromARGB(255, 145, 34, 26),
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("\$"+ widget.food.price,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,

                        ),)
                      /*Row(
                        children: [

                      ],)*/
                      
                      ],
                    )

                ],),
              )

      ],
      ),
    );
  }
}