import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prmda/models/food.dart';


class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({
    super.key,
    required this.food,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(food.ImagePath, height: 140),
          Text(
            food.name,
            style: GoogleFonts.acme(fontSize: 20),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₽${food.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                     const Icon(Icons.star, color: Colors.yellow),
                    
                    Text(
                      food.Description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ),
  );
}

}

