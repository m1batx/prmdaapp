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
        SnackBar(content: Text('Неправильный email!', style: TextStyle(color: Theme.of(context).colorScheme.surface),),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
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
        SnackBar(
          content: Text('Данные сохранены!', style: TextStyle(color: Theme.of(context).colorScheme.surface),),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Вы не авторизованы!', style: TextStyle(color: Theme.of(context).colorScheme.surface),),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              return Center(child: Text('Данные пользователя не найдены', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),));
            }
            else if (snapshot.hasData){
              var userData = snapshot.data!.data()!;
              _nameController.text= userData['name'];
              _emailController.text= userData['email'];
              _phoneController.text= userData['phone'];
              return Column(
                children: [
                  TextField(
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'ФИО', 
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                      focusColor: Theme.of(context).colorScheme.primary,
                      fillColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                      focusColor: Theme.of(context).colorScheme.primary,
                      fillColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15,),
                  TextField(
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Телефон',
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                      focusColor: Theme.of(context).colorScheme.primary,
                      fillColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [_phoneMask],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveUserData,
                    child: const Text('Сохранить'),
                  ),
                ],
              );
            }
            else{
            return const Text("Данные не найдены!");
          }
          }
        )
      ),
    );
  }
}