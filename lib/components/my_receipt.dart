import 'package:flutter/material.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget{
  final String adress;
  const MyReceipt({super.key, required this.adress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Спасибо за заказ"),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8)
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restraunt>(
                builder: (context, restraunt, child)=> 
                FutureBuilder<String>(
                  future: restraunt.displayCartReceipt(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); 
                    }
                    else if (snapshot.hasError) {
                      return Text('Ошибка: ${snapshot.error}'); // Display an error message if an error occurs
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('Данные не были загружены'); // Display a message if no data is found
                    } else {
                      return Text("${snapshot.data}\nАдрес самовывоза: $adress"); // Display the fetched data
                    }
                  },
                )
                
                ),
            )
          ],
        ),
      ),
    );
  }


}