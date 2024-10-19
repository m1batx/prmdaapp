import 'package:flutter/material.dart';

class ONas extends StatefulWidget {
  const ONas({super.key});

  @override
  State<ONas> createState() => _ONasState();
}

class _ONasState extends State<ONas> {
  final List<String> addresses = [
    'Московский район, Авиационная улица, 15',
    'Невский район, Народная улица, 21',
    'Невский район, улица Седова, 106',
    'Невский район, улица Коллонтай, 28к1',
    'Красносельский район, проспект Ветеранов, 173к1'
  ];
  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('О НАС', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top section with an image
                Container(
                  child: Center(
                    child: Image.network(
                      'lib/images/sources/aboutus-1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Middle section with text
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '«Пирамида» — современная компания, работающая в сфере быстрого питания. Мы предлагаем широкий ассортимент блюд, а наша команда профессионалов заботится о качестве продукции и сервиса, чтобы удовлетворить вкусы самых взыскательных гостей.',
                    style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
                const SizedBox(height: 20),
                //SizedBox(height: 20),
                // Bottom section with two boxes side by side, each containing an image
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Image.network(
                            'lib/images/compressed/shrimp 2.jpeg', // Replace with your image URL
                            fit: BoxFit.cover,
                            height: 250,
                            width: 175,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 250,
                        width: 175,
                        child: Center(
                          child: Column(
                            children: [
                              Image.network(
                                'lib/images/compressed/govyadina na tarelki 2.jpeg', // Replace with your image URL
                                fit: BoxFit.cover,
                              ),
                              const Spacer(),
                              Image.network(
                                'lib/images/compressed/Cirni lavash 2.jpeg', // Replace with your image URL
                                fit: BoxFit.cover,
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                Text(
                  'Наши точки:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(height: 10),
                ...addresses.map((address) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(address, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                  );
                }),
              ],
            ),
          ),
        )
        )
    );
  }
}


