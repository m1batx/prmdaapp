import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/home_screen.dart';

class SettingsPage extends StatefulWidget{
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<DocumentSnapshot<Map<String,dynamic>>> getUserDetails() async{
    return await FirebaseFirestore.instance
    .collection("Users").doc(_auth.currentUser!.email).get();
  }


  void _saveUserData() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('Users').doc(user.email).set({
        'name': name,
        'email': email,
        'phone': phone,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data saved successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not authenticated!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пользовательские настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: getUserDetails(), 
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasError){
              return const HomeScreen();
            }
            else if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('Данные пользователя не найдены'));
            }
            else if (snapshot.hasData){
              var userData = snapshot.data!.data()!;
              _nameController.text= userData['name'];
              _emailController.text= userData['email'];
              _phoneController.text= userData['phone'];
              return Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveUserData,
                    child: const Text('Save'),
                  ),
                ],
              );
            }
            else{
            return const Text("No data!");
          }
          }
        )
      ),
    );
  }
}