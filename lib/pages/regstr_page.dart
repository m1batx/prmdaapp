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

        displayMessageToUser("Passwords don't match", context);
      }
      else{
        try{
        // ignore: unused_local_variable
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      }on FirebaseAuthException {
        displayMessageToUser("Error has occured! Try again later", context);
      }
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
                "REGISTER",
                style: TextStyle(fontSize: 20),
              ),

              //username textfield
              const SizedBox(height: 50),
              MyTextfield(
                hintText: "Username",
                obscureText: false,
                controller: usernameController,
              ),

              //email textfield
              const SizedBox(height: 10),
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
              
              //confirm password textfield
              const SizedBox(height: 10),
              MyTextfield(
                hintText: "Confirm password",
                obscureText: true,
                controller: confirmpasswordController,
              ),
              
              const SizedBox(height: 25),
              //sign in button
              MyButton(
                text: "Register", 
                onTap: register
              ),
              
              const SizedBox(height: 25),


              //don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?"
                  ),
                  GestureDetector(
                    onTap: () {Navigator.pushNamed(context,'/login');},
                    child: const Text(
                      "Log in",
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