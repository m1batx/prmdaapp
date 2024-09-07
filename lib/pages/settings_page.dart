import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
  final MaskTextInputFormatter _phoneMask = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

   bool _validateEmail(String email) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(email);
  }

  void _saveUserData() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    if (!_validateEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неправильный email!')),
      );
      return;
    }

    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('Users').doc(user.email).set({
        'name': name,
        'email': email,
        'phone': phone,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Данные сохранены!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Вы не авторизованы!')),
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
                    decoration: const InputDecoration(labelText: 'ФИО'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Телефон'),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [_phoneMask],
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