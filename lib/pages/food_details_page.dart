import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prmda/components/button.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
class FoodDetailsPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddon ={};
  FoodDetailsPage({
    super.key, 
    required this.food
    })
    {
      for (Addon addon in food.availableAddons){
        selectedAddon[addon] = false;
      }
    }
    



  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
  
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
    //quantity
    int quantityCount = 0 ;

    //decrement
    void decrementQuanitity(){
      setState(() {
        quantityCount --;
      });
    }

    //increment
    void incrementQuantity(){
      setState(() {
        setState(() {
          quantityCount ++;
        });
      });
    }

    //add to  

  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    Navigator.pop(context);
    List<Addon> currentlySelectAddons = [];
    for (Addon addon in widget.food.availableAddons){
      if (widget.selectedAddon[addon] == true){
        currentlySelectAddons.add(addon);
      }
    }
    context.read<Restraunt>().addToCart(food, currentlySelectAddons);
    //context.read<Restraunt>().addToCart(food, currentlySelectAddons);

  }/*
    //only add to cart if there is somthing to add 
    if (quantityCount > 0 ){
      //gett access to shop 

      //add to cart 
      addToCart(widget.food, quantityCount);

      //let the user know it add successfully 
      showDialog(context: context, builder: builder)

    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(widget.food.ImagePath,),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column( // Outer Column
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getMeatTypeString(widget.food.meatType),
                        style:  TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                      Text(
                        widget.food.name,
                        style: GoogleFonts.acme(fontSize: 28, color: Theme.of(context).colorScheme.inversePrimary,),
                        textAlign: TextAlign.left, // You can remove this now
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Описание",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.food.Description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 14,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
            // Addons
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: widget.food.availableAddons.length,
              itemBuilder: (context,index) {
                Addon addon = widget.food.availableAddons[index];
                return CheckboxListTile(
                  checkColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Text(
                    addon.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),),
                  subtitle: Text(
                    '${addon.price}₽',
                    style:  TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  value: widget.selectedAddon[addon], 
                  onChanged: (bool? value){
                    setState(() {
                      widget.selectedAddon[addon] = value!;
                    });
                  },
                );
              }
              ),
            Container(
              color: const Color.fromARGB(255, 145, 34, 26),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                    
                    MyButton(
                      text: "В корзину", 
                      onTap: ()=>addToCart(widget.food, widget.selectedAddon)
                    )

                ],),
              )

      ,
      ]),
      )
    ),
    SafeArea(
      child:Opacity(
        opacity: 0.6,
        child: Container(
          margin: const EdgeInsets.only(left: 25,top: 25),
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: ()=> Navigator.pop(context)),
            ),
        ),), 
      ],
    );
  }
}
