import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: onTap,
      child: Container(
      
        decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.pacifico(
                fontSize: 12,
                color:const Color.fromARGB(255, 0, 0, 0),
              )
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward, color: Colors.white),
      
        ],) 
      ),
    );
  }
}