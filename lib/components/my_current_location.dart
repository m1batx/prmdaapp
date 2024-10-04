import 'package:flutter/material.dart';
import 'package:prmda/restraunt.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {
  final String selectedAddress;

  const MyCurrentLocation({super.key, required this.selectedAddress});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final List<String> addresses = [
    'Московский район, Авиационная улица, 15',
    'Невский район, Народная улица, 21',
    'Невский район, улица Седова, 106',
    'Невский район, улица Коллонтай, 28к1',
    'Красносельский район, проспект Ветеранов, 173к1'
  ];

  // Variable to hold the selected address
  String selectedAddress = "Не выбрано";

  void openLocationSearchBox(BuildContext context) {
    //selectedAddress =context.read<Restraunt>().address;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title:  Text(
          "Точки самовывоза", 
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          )),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              
              return ListTile(
                title: Text(addresses[index], 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  )),
                onTap: () {
                  setState(() {
                    selectedAddress = context.read<Restraunt>().changeAddress(addresses[index]);
                  });
                  // Close the dialog
                  Navigator.pop(context);
                },
                selected: selectedAddress == addresses[index],
                selectedTileColor: Colors.red.withOpacity(0.1),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    selectedAddress =context.read<Restraunt>().address;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Самовывоз",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                  selectedAddress,
                  style:  TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).colorScheme.inversePrimary,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}