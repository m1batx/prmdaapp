import 'package:flutter/material.dart';

class RegstrPage extends StatefulWidget {
  @override
  _RegstrPageState createState() => _RegstrPageState();
}

class _RegstrPageState extends State<RegstrPage> {
  
  String _email = '', _password = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
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
              decoration: InputDecoration(hintText: 'Enter your email'),
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(hintText: 'Enter your password'),
            )
            
          ],
        ),
      ),
    );
  }
}

