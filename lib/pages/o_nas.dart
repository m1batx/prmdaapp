import 'package:flutter/material.dart';

class ONas extends StatefulWidget {
  const ONas({super.key});

  @override
  State<ONas> createState() => _ONasState();
}

class _ONasState extends State<ONas> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('О НАС'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '«Пирамида» — современная компания, работающая в сфере быстрого питания. Мы предлагаем широкий ассортимент блюд, а наша команда профессионалов заботится о качестве продукции и сервиса, чтобы удовлетворить вкусы самых взыскательных гостей.',
                style: TextStyle(fontSize: 16),
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
                        'lib/images/angle_2/shrimp 2.jpg', // Replace with your image URL
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
                            'lib/images/angle_2/govyadina na tarelki 2.jpg', // Replace with your image URL
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          Image.network(
                            'lib/images/angle_2/Cirni lavash 2.jpg', // Replace with your image URL
                            fit: BoxFit.cover,
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


