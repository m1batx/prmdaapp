import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:prmda/components/my_textfield.dart';
import 'package:prmda/helper/helper_functions.dart';
class RegstrPage extends StatefulWidget{



  const RegstrPage({super.key});

  @override
  State<RegstrPage> createState() => _RegstrPageState();
}

class _RegstrPageState extends State<RegstrPage> {
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  void register() async{
    showDialog(
        context: context, 
        builder: (context) => const Center(
          child: CircularProgressIndicator(),

        )
      );

      if (passwordController.text!=confirmpasswordController.text){
        Navigator.pop(context);

        displayMessageToUser("Пароли не совпадают", context);
      }
      else{
        try{
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        User? user = userCredential.user;
        if (user != null) {
          await FirebaseFirestore.instance.collection('Users').doc(user.email).set({
            'name': usernameController.text,
            'email': emailController.text,
            'phone': '',
            'uid': user.uid
          });
          if (!user.emailVerified){
            await user.sendEmailVerification();
          }
        }
        Navigator.pop(context);
        FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        Navigator.pop(context);
      }on FirebaseAuthException {
        displayMessageToUser("Возникла ошибка! Попробуйте позже", context);
      }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),
              Text(
                "РЕГИСТРАЦИЯ",
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary),
              ),

              //username textfield
              const SizedBox(height: 50),
              MyTextfield(
                hintText: "Имя пользователя",
                obscureText: false,
                controller: usernameController,
              ),

              //email textfield
              const SizedBox(height: 10),
              MyTextfield(
                hintText: " Email",
                obscureText: false,
                controller: emailController,
              ),

              //password textfield
              const SizedBox(height: 10),
              MyTextfield(
                hintText: "Пароль",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              
              //confirm password textfield
              const SizedBox(height: 10),
              MyTextfield(
                hintText: "Подтвердите пароль",
                obscureText: true,
                controller: confirmpasswordController,
              ),
              
              const SizedBox(height: 25),
              //sign in button
              MyButton(
                text: "Регистрация", 
                onTap: register
              ),
              
              const SizedBox(height: 25),


              //don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Уже есть аккаунт?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {Navigator.pushNamed(context,'/login');},
                    child: Text(
                      "Войти",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  )
                ],
              )
              
            ],
          ),
        ),
      ),
      )
    );
  }
}