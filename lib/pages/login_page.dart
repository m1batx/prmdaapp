import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prmda/components/button.dart';
import 'package:prmda/components/my_textfield.dart';
import 'package:prmda/helper/helper_functions.dart';
import 'package:prmda/pages/home_page.dart';
class LoginPage extends StatefulWidget{



  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void login() async{
    showDialog(
      context: context, 
      builder: (context)=> const Center(
        child: CircularProgressIndicator(),
      )

    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

      if (context.mounted) Navigator.pop(context);
    }
    on FirebaseAuthException {
      Navigator.pop(context);
      displayMessageToUser("Error has occured! Try later", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 80,
              ),

              const SizedBox(height: 25),
              const Text(
                "LOG IN",
                style: TextStyle(fontSize: 20),
              ),

              //email textfield
              const SizedBox(height: 50),
              MyTextfield(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              //password textfield
              const SizedBox(height: 10),
              MyTextfield(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),

              //forgot email
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                  ),
                ],
              ),

              const SizedBox(height: 25),
              //sign in button
              MyButton(
                text: "Login", 
                onTap: login
              ),
              
              const SizedBox(height: 25),


              //don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?"
                  ),
                  GestureDetector(
                    onTap: () {Navigator.pushNamed(context,'/regstrationpage');},
                    child: const Text(
                      "Register Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  )
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}