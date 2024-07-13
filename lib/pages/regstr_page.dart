import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/services/firestore.dart';

class RegstrPage extends StatefulWidget {
  @override
  _RegstrPageState createState() => _RegstrPageState();
}

class _RegstrPageState extends State<RegstrPage> {
  String _email = '', _password = '';
  
  @override
  Widget build(BuildContext context) {
    final FirestoreService firestoreService = FirestoreService();
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
            ),
            ElevatedButton(
              onPressed: ()  {
                firestoreService.addUser(
                     _email,  _password);
              },
              child: Text('Register'),
            )
                        
          ],
        ),
      ),
    );
  }
}

