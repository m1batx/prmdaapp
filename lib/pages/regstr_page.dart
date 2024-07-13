import 'package:flutter/material.dart';

class RegstrPage extends StatefulWidget {
  const RegstrPage({super.key});

  @override
  _RegstrPageState createState() => _RegstrPageState();
}

class _RegstrPageState extends State<RegstrPage> {
  
  String _email = '', _password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('Register Page'),
=======
        title: Text('Register Page'),
>>>>>>> f2750c0042dbd9d48365cc96f6b983a3e1841705
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
<<<<<<< HEAD
              decoration: const InputDecoration(hintText: 'Enter your email'),
=======
              decoration: InputDecoration(hintText: 'Enter your email'),
>>>>>>> f2750c0042dbd9d48365cc96f6b983a3e1841705
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
<<<<<<< HEAD
              decoration: const InputDecoration(hintText: 'Enter your password'),
=======
              decoration: InputDecoration(hintText: 'Enter your password'),
>>>>>>> f2750c0042dbd9d48365cc96f6b983a3e1841705
            )
            
          ],
        ),
      ),
    );
  }
}

