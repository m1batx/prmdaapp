import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prmda/models/food.dart';


class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({
    super.key,
    required this.food,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Image.asset(food.ImagePath, height: 140),
            Text(food.name,
            style: GoogleFonts.acme(fontSize: 20),
            ),
            ],
          ),
    );
  }
}

